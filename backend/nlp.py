from google.cloud import language
from google.cloud.language import enums
from google.cloud.language import types
from collections import Counter


def language_process(uri):
	gcs_uri = uri

	client = language.LanguageServiceClient()

	document = types.Document(
	    gcs_content_uri=gcs_uri,
	    type=enums.Document.Type.PLAIN_TEXT)

	categories = client.classify_text(document).categories

	# for category in categories:
	#     print(u'=' * 20)
	#     print(u'{:<16}: {}'.format('name', category.name))
	#     print(u'{:<16}: {}'.format('confidence', category.confidence))

	tokens = client.analyze_syntax(document).tokens

	# for token in tokens:
	#     part_of_speech_tag = enums.PartOfSpeech.Tag(token.part_of_speech.tag)
	#     # print(u'{}: {}'.format(part_of_speech_tag.name,
	#                            # token.text.content))

	dic = {}

	for token in tokens:
		part_of_speech_tag = enums.PartOfSpeech.Tag(token.part_of_speech.tag)
		if part_of_speech_tag == enums.PartOfSpeech.Tag.NOUN :
			if dic.get(token.text.content) is None :
				dic[token.text.content] = 1
			else:
				dic[token.text.content] += 1
	a = dict(Counter(dic).most_common(5))

	keyword = ''
	for key in a:
		keyword = keyword + key + ' : ' + a[key] + '\n'

	# print(u'{}'.format(a))

	sentiment = client.analyze_sentiment(document).document_sentiment

	if sentiment.score > 0.7 :
		result = 'really positive'
	elif sentiment.score > 0.3 :
		result = 'positive'
	elif sentiment.score > 0.05 :
		result = 'neutral'
	else:
		result = 'negative'

	return category.name, keyword, result

	# print('Score: {}'.format(sentiment.score))
	# print('Magnitude: {}'.format(sentiment.magnitude))
	# print('Sentiment: {}'.format(result))