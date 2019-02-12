from __future__ import unicode_literals
from __future__ import print_function
import spacy
from spacy import displacy

# nlp = spacy.load('en_core_web_lg')
nlp = spacy.load('en')

# sementic similarity
def compare(answer, target):
	answer_nlp = nlp(answer)
	target_nlp = nlp(target)
	similarity = answer_nlp.similarity(target_nlp)
	return similarity


def entities(answer):
	answer_nlp = nlp(answer)
	return answer_nlp.ents


def render_entities(text, style = 'ent'):
	if style == 'ent':
		options = {}
	else:
		options = {
			'compact': False, 'bg': '#09a3d5',
        	'color': 'white', 'font': 'Source Sans Pro', 
        	'arrow_spacing': 7, 'distance': 100, 'offset_x': 40
       }
	
	doc = nlp(text)
	return displacy.render(doc, style, options=options)
