# Make sure this profile has Lambda loading and execution permissions
#Make sure this is correct for KMS and Lambda
#Keep them the same region for performance!


#Deliverable
SRC=index.html album.css main.js
SEND=.index.html.sent .album.css.sent .main.js.sent
ZIP=zip
ZIPOPTIONS=-r
ZIPFILE=call-site.zip
site=call-site


#Flags
#Flag for updating Lambda
site_DELIVERED=site_delivered
site_TESTED=site_tested
site_ROLE_TESTED=site_role_tested


$(site_DELIVERED): $(SRC)
	gsutil cp $(SRC) gs://www.petqts.com
	$(foreach var, $(SRC), gsutil acl ch -u AllUsers:R gs://www.petqts.com/$(var);)
	#gsutil acl ch -u AllUsers:R gs://www.petqts.com/$<
	touch $(site_DELIVERED)

#$(SEND): $(SRC)
	#gsutil cp $@ gs://www.gc-tips.com
#	$(foreach var, $(SRC), gsutil acl ch -u AllUsers:R gs://www.gc-tips.com/$(var);)
#	$(foreach var, $(SRC), gsutil acl ch -u AllUsers:R gs://www.gc-tips.com/$(var);)


all: $(site_DELIVERED) 

