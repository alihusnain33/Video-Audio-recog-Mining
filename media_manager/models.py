from django.db import models
from django_mysql.models import ListCharField, SetTextField
from django.utils.translation import ugettext_lazy as _

class Candidate(models.Model):
	name 	= models.CharField(max_length=255)
	email 	= models.EmailField(max_length=255)

	def __str__(self):
		return "{} - {}".format(self.name, self.email)


class Question(models.Model):
	text 	= models.TextField()
	reference_answer = models.TextField(default=None, blank=True, null=True)
	keywords_csv = SetTextField(
			models.CharField(max_length=70, blank=True),
		)
	# keywords_csv = models.TextField()

	def __str__(self):
		return self.text


class Media(models.Model):
	class Meta:
		verbose_name = _("AnswerMedia")
		verbose_name_plural = _("AnswerMedia")

	title 			= models.CharField(max_length=255)
	original_url	= models.CharField(max_length=255)
	m_format		= models.CharField(max_length=20)
	created_at		= models.DateTimeField(auto_now_add=True)
	candidate		= models.ForeignKey(Candidate, on_delete=models.CASCADE)
	question		= models.ForeignKey(Question, on_delete=models.CASCADE)

	def __str__(self):
		return self.title

class Score(models.Model):
	candidate = models.ForeignKey(Candidate, on_delete=models.CASCADE)
	question = models.ForeignKey(Question, on_delete=models.CASCADE)
	similarity_score = models.FloatField(null = True, blank = True, default = None)
	entities = models.TextField(null = True, blank = True, default = None)

	def __str__(self):
		return "[{}] scored {} on {}".format(self.candidate.email, self.similarity_score, self.question.text)


class Text(models.Model):
	class Meta:
		verbose_name = _("AnswerText")
		verbose_name_plural = _("AnswerText")

	media 		= models.ForeignKey(Media, on_delete=models.SET_NULL, null = True, blank = True, default = None)
	candidate 	= models.ForeignKey(Candidate, on_delete=models.CASCADE)
	question 	= models.ForeignKey(Question, on_delete=models.CASCADE, related_name='Text')
	score 		= models.ForeignKey(Score, on_delete=models.SET_NULL, null = True, blank = True, default = None)
	text 		= models.TextField()

	def __str__(self):
		return "{} [{}] - Answer to - {} ".format(self.candidate.name, self.candidate.email, self.question.text)


