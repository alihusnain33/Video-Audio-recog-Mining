from django.contrib import admin
from . models import Media, Text, Candidate, Question, Score

admin.site.site_title = 'Admin'
admin.site.site_header = 'Admin'

@admin.register(Candidate, Media, Score, Question, Text)
class MyAdmin(admin.ModelAdmin):
	pass

# admin.site.register(Candidate, MyAdmin)