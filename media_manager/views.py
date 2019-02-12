from django.shortcuts import render
from django.views import generic

from . models import Media, Text, Candidate, Question, Score

from . import utils

def index(request):
	# context = {}
	return render(request, 'index.html', {})


def candidates(request):
	candidates = Candidate.objects.all()
	questions = Question.objects.all()

	return render(request, 'candidates.html', {
		'candidates':	candidates,
		'questions':	questions
	})

def candidate(request, id):
	candidate = Candidate.objects.get(id=id)
	questions = Question.objects.all()
	context = { 'candidate': candidate, 'questions': questions }
	return render(request, 'candidate.html', context)

def profile(request, candidate_id, question_id):
	candidate = Candidate.objects.get(id=candidate_id)
	question = Question.objects.get(id=question_id)

	try:
		answer = Text.objects.get(question_id=question_id, candidate_id=candidate_id)
	except Exception as e:
		answer = None
		return render(request, 'error.html', {})
	
	try:
		score = Score.objects.get(question_id=question_id, candidate_id=candidate_id)
	except Exception as e:
		score = None

	entities = utils.entities(answer.text)

	if score == None and answer != None:
		entities_str = ''
		for entity in entities:
			entities_str += entity.text + ', '

		score = Score.objects.create(
			question_id = question_id,
			candidate_id = candidate_id,
			similarity_score = utils.compare(answer.text, question.reference_answer),
			entities = entities_str
		)
		# answer.score_id = score.id
		# answer.save()
	else:
		similarity_score = score.similarity_score

	if score.similarity_score == None:
		score.similarity_score = utils.compare(answer.text, question.reference_answer)
		score.save()

	similarity_score = score.similarity_score

	return render(request, 'profile.html', {
		'candidate': candidate, 
		'question': question,
		'answer': answer,
		'similarity_score': round(similarity_score, 2),
		'grade': str(round(similarity_score * 5, 2)) + ' / 5',
		'entities': entities,
		'answer_markup': utils.render_entities(answer.text),
		'reference_markup': utils.render_entities(question.reference_answer),
		'answer_dependency': utils.render_entities(answer.text, style='dep'),
		'reference_dependency': utils.render_entities(question.reference_answer, style='ent')
	})


# class IndexView(generic.ListView):
# 	template_name = 'templates/index.html'
# 	context_object_name = 'candidate_list'

# 	def get_queryset(self):
# 		return Candidate.objects.all()

