from . models import *
from rest_framework import serializers


class QuestionSerializer(serializers.ModelSerializer):
	class Meta:
		model = Question
		fields = ('text', 'reference_answer', 'keywords_csv')


class MediaSerializer(serializers.ModelSerializer):
	class Meta:
		model = Media
		fields = ('title', 'm_format')

class ScoreSerializer(serializers.ModelSerializer):
	# candidate = CandidateSerializer()
	question = QuestionSerializer()

	class Meta:
		model = Score
		fields = ('question', 'similarity_score')

class AnswerTextSerializer(serializers.ModelSerializer):
	media = MediaSerializer()
	# score = ScoreSerializer()

	class Meta:
		model = Text
		fields = ('text', 'media', 'score')


class CandidateSerializer(serializers.ModelSerializer):
	# media_set = MediaSerializer(many=True, read_only=True)
	text_set = AnswerTextSerializer(many=True, read_only=True)

	class Meta:
		model = Candidate
		fields = ('name', 'email', 'text_set')

# class ProfileSerializer(serializers.ModelSerializer):
# 	# text_set = AnswerTextSerializer(many=True, read_only=True)

# 	class Meta:
# 		model = Candidate
# 		fields = ('output')

# class ChoiceSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Choice
#         fields = ('question', 'choice_text', 'votes')


# class QuestionSerializer(serializers.ModelSerializer):
#     choice_set = ChoiceSerializer(many=True, read_only=True)
#     #choice_set = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

#     class Meta:
#         model = Question
#         fields = ('question_text', 'pub_date', 'choice_set')
