#immigration road map

def start()

	p "Welcome to the Immigration Road Map!"

	p "This app is designed to help you navigate the"

	p "Visa process for entry into the United States"

	p "All the following questions should be answered"

	p "by typing Y or N (for yes or no),"

	p "and then pressing ENTER on your keyboard."


	puts """
	Disclaimer:

	This immigration roadmap is for general guidance only and shall
	NOT be construed as legal advice; US immigration laws and regulations
	are ever-changing, so always confirm with USCIS and/or consult a
	legal professional with respect to your case; No warranty is
	made regarding the accuracy of any information; Not all
	possible paths to a to Green Card are covered by this app, and eligibility
	for appeals/motions to reopen are not included.

	Additionally, please note that none of your answers or any personal
	information will be saved from your session here.

	Let's begin!


	"""

	p
	p
	p

	job_opportunity?()

end

def job_opportunity?()

	puts "
	First Question! Do you have a job opportunity in the United States?
	"

	choice = gets.chomp

	if choice.upcase == "Y"
		already_in_US?()
	elsif choice.upcase == "N"
		nonimmigrant_visa?()
	else
		job_opportunity?
	end
end


def already_in_US?()
	p "Are you already inside the USA?"
	choice = gets.chomp
	if choice.upcase == "Y"
		in_legal_status?()
	elsif choice.upcase == "N"
		nonimmigrant_visa?()
	else
		already_in_US?()
	end
end


def nonimmigrant_visa?()
	p """
	Can you get a non-immigrant visa (NIV)?

	A nonimmigrant visa (NIV) is issued to a person with permanent residence
	outside the United States, but wishes to be in the U.S. on a temporary
	basis for tourism, medical treatment, business, temporary work or study,
	as examples.

	"""

	choice = gets.chomp

	if choice.upcase == "Y"
		in_legal_status?()
	elsif choice.upcase == "N"
		employer_sponsor?()
	else
		nonimmigrant_visa?()
	end
end

def employer_sponsor?()
	p "Is your employer still willing to sponsor you?"

	choice = gets.chomp

	if choice.upcase == "Y"

		p """The process is similar to EB adjustment of status, except that you
		must go through an interview at the US Embassy or consulate.

		Employer files I-140 petition for you.
		"""

		i_140_approved?()

	elsif choice.upcase == "N"
		family_in_US?()
	else
		employer_sponsor?()
	end
end

def i_140_approved?()
	p "Was your I-140 petition approved?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "Approved I-140 is sent to the National Visa Center (NVC)."

		visa_number_available?()
	elsif choice.upcase == "N"
		i_140_denied?()
	else
		i_140_approved?()
	end
end

def visa_number_available?()
	p "Visa number available?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "Go to US Consulate for interview."

		uscis_checks?()
	elsif choice.upcase == "N"
		p "Wait..."
		uscis_checks?()
	else
		visa_number_available?()
	end
end

def uscis_checks?()
	p "USCIS security checks cleared?"

	choice = gets.chomp

	if choice.upcase == "Y"
		meet_all_reqs?()
	elsif choice.upcase == "N"
		p "Wait..."
		uscis_checks?()
	else
		uscis_checks?()
	end
end

def meet_all_reqs?()

	p "Did you meet all the USCIS requirements?"

	choice = gets.chomp

	if choice.upcase == "Y"

		p "Receive immigrant visa, enter US as a permanent resident.

		Receive I-551 stamp in passport at port of entry; green card will arrive in mail!"
	elsif choice.upcase == "N"
		sorry()
	else
		meet_all_reqs?()
	end
end

def meet_all_checks?()
	p "Did you meet all the requirements?"

	choice = gets.chomp
	if choice.upcase == "Y"
		p """
		Receive immigrant visa, enter US as a permanenet resident.

		Receive I-551 stamp in passport at port of entry;
		GREEN CARD will arrive in the mail!
		"""
	elsif choice.upcase == "N"
		sorry()
	else
		meet_all_checks?()
	end
end

def i_140_denied?()
	p "Was your I-140 denied?"

	choice = gets.chomp

	if choice.upcase == "Y"
		sorry()
	elsif choice.upcase == "N"
		i_140_approved?()
	else
		i_140_denied?()
	end
end

def in_legal_status?()
	p "Are you inside the USA legally?"
	choice = gets.chomp
	if choice.upcase == "Y"
		h1_l1?()
	elsif choice.upcase == "N"
		in_US_since_72?()
	else
		in_legal_status?()
	end
end

def family_in_US?() #from job_opportunity and employer sponsor
	p "Do you have a family member in the USA?"
	choice = gets.chomp
	if choice.upcase == "Y"
		relative_US_citizen?()
	elsif choice.upcase == "N"
		diversity_visa?()
	else
		family_in_US?()
	end
end


def diversity_visa?()
	p "Are you eligible for a diversity visa? You can check this at:"
	p "https://travel.state.gov/content/visas/en/immigrate/diversity-visa/entry.html"
	choice = gets.chomp
	if choice.upcase == "Y"
		p """
		Each year there are 50,000 diversity visas available.
		This is known as the Green Card Lottery.

		The Department of State sets new rules every year for the Diversity Visa Lottery,
		which runs from October to December.

		You may enter the lottery whether you are in the USA or another country.
		"""

		native_low_immigration()

		elsif choice.upcase == "N"
			investor_visa?()
		else
			diversity_visa?()
	end
end

def native_low_immigration()
	p "Are you a native of a country with low rate of immigration to USA?"

	choice = gets.chomp

	if choice.upcase == "Y"
		high_school_education?()
	elsif choice.upcase == "N"
		nativity_spouse?()
	else
		native_low_immigration()
	end
end

def nativity_spouse?()
	p "Can you claim nativity of your spouse or parent, which is eligible?"

	choice = gets.chomp

	if choice.upcase == "Y"
		high_school_education?()
	elsif choice.upcase == "N"
		sorry()
	else
		nativity_spouse?()
	end
end

def high_school_education?()
	p "Do you have at least a high school education?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "
		Step 1. Submit Diversity Visa entry form, along with all supporting
		documents to Department of State by lottery deadline.

		Note: It is free to enter the Diversity Visa lottery.

		Step 2. Applicants are selected at random by the computer system.

		Step 3. You will receive a notification if you win the lottery

		Note: winning doesn't guarantee a green card, though.

		Step 4. Follow instructions to submit your immigrant visa application.

		Step 5. Pay application and other fees.

		Step 6. Go through US Consulate interview for immigrant visa (or file
			I-485 if you are in the USA)

		Step 7. Either way the entire process must be completed before the
		deadline (or allotted Diversity Visas) runs out.

		Step 8. Receive immigratnt visa, enter USA as permanent resident
		(or adjust your status).

		Step 9. GREEN CARD
		"
	elsif choice.upcase == "N"
		two_years_work()
	else
		high_school_education?()
	end
end

def two_years_work()
	p "Do you have at least 2 years of work experience?"

	choice = gets.chomp

	if choice.upcase == "Y"

		p "
		Step 1. Submit Diversity Visa entry form, along with all supporting
		documents to Department of State by lottery deadline.

		Note: It is free to enter the Diversity Visa lottery.

		Step 2. Applicants are selected at random by the computer system.

		Step 3. You will receive a notification if you win the lottery

		Note: winning doesn't guarantee a green card, though.

		Step 4. Follow instructions to submit your immigrant visa application.

		Step 5. Pay application and other fees.

		Step 6. Go through US Consulate interview for immigrant visa (or file
			I-485 if you are in the USA)

		Step 7. Either way the entire process must be completed before the
		deadline (or allotted Diversity Visas) runs out.

		Step 8. Receive immigratnt visa, enter USA as permanent resident
		(or adjust your status).

		Step 9. GREEN CARD
		"

	elsif choice.upcase == "N"
		sorry()
	else
		two_years_work()
	end
end



def investor_visa?()
	p "Can you invest $500,000 to $1,000,000?"
	choice = gets.chomp
	if choice.upcase == "Y"
		p """
		Each year there are over 10,000 EB-5 visas available for investors,
		with 3,000 set aside for 'regional center' program participants.
		"""
		start_business?()

	elsif choice.upcase == "N"
		sorry()
	else
		investor_visa?()
	end
end

def start_business?()
	p "Can you start a business?"
	choice = gets.chomp
	if choice.upcase == "Y"
		invest_1m?()
	elsif choice.upcase == "N"
		transform_biz?()
	else
		start_business?()
	end
end

def transform_biz?()
	p "Can you transform an existing business?"

	choice = gets.chomp

	if choice.upcase == "Y"
		invest_1m?()
	elsif choice.upcase == "N"
		struggling_biz?()
	else
		transform_biz?()
	end
end

def struggling_biz?()
	p "Can you save a struggling business?"

	choice = gets.chomp

	if choice.upcase == "Y"
		invest_1m?()
	elsif choice.upcase == "N"
		sorry()
	else
		struggling_biz?()
	end
end

def targeted_employment?()
	p "Can you invest $500,000 in a targeted employment area?"

	choice = gets.chomp

	if choice.upcase == "Y"
		job_creator()
	elsif choice.upcase == "N"
		sorry()
	else
		targeted_employment?()
	end
end

def invest_1m?()
	p "Can you invest $1,000,000?"

	choice = gets.chomp

	if choice.upcase == "Y"
		job_creator()
	elsif choice.upcase == "N"
		targeted_employment?()
	else
		invest_1m?()
	end
end

def job_creator()
	p "Can you create 10 jobs or maintain employee level at a struggling business?"
	choice = gets.chomp

	if choice.upcase == "Y"
		p """
		Step 1. Submit form I-526 (Immigrant Petition by Alien Entrepreneur)

		Step 2. Approved I-526 is sent to US Embassy or consulate.
		(Or, if you are already in US and elected to adjust status, you
		may now file I-485.)

		Step 3. Go through consulate interview for immigrant visa.

		Step 4. Receive immigrant visa.

		Step 5. Enter US and receive conditional green card (valid 2 years).

		Step 6. Submit form I-829 to remove conditions within 90 days before
		2nd anniversary.

		Step 7. GREEN CARD
		"""


	elsif choice.upcase == "N"
	else
		job_creator()
	end
end


#FIX THIS TEXT OUTPUT

def in_US_since_72?()
	p "Have you been in the USA since 1972?"
	choice = gets.chomp

	if choice.upcase == "Y"
		p "
		Congratulations!

		You may be eligible for a green card through the Registry.
		"
	elsif choice.upcase == "N"
		p '
		1. Overstaying visa.

		2. Violating visa terms.

		3. Entering without inspection.

		Some waivers exist, such as 245(i) for certain eligible illegal
		immigrants.  For others, there is currently no path to legalization.
		'
	else
		in_US_since_72?()
	end
end

def h1_l1?()
	p "Are you working on your H1, L1 visa, etc?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "Congratulations! You may start employment based immigration."

		what_category?()
	elsif choice.upcase == "N"
		p "If needed, change your status before the end of your stay.

		Follow any path (EB, FB, etc.) to Green Card.

		Be sure not to jeopardize your legal status while doing so.

		NIV to AOS may raise the question abou your intent while applying.

		Below are a few examples."

		f1_j1_student?()
	else
		h1_l1?()
	end
end

def f1_j1_student?()
	p "Are you an F1 / J1 student?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p """

		CONGRATULATIONS! You qualify for a green card!

		Step 1. Find a job (NOTE: J1 waiver required)

		Step 2. Apply for OPT, H1B and start employment based immigration.
		"""
	elsif choice.upcase == "N"
		b1_b2_visitor?()
	else
		f1_j1_student?()
	end
end

def b1_b2_visitor?()
	p "Are you a B1 / B2 visitor?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p """
		CONGRATULATIONS! You may qualify for a green card!

		Step 1. File family-based AOS (adjustment of status), or

		Step 2. Change to another NIV (non-immigrant visa) if eligible.
		"""
	elsif choice.upcase == "N"
		refugee?()
	else
		b1_b2_visitor?()
	end
end

def refugee?()
	p "Are you a refugee, or seeking asylum?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p """

		CONGRATULATIONS! You may be eligible for a green card!

		Step 1. File I-485 one year after being admitted as refugee
		or being granted asylum.

		Step 2. Refugee is required to file AOS (adjustment of status);
		Asylum seeker is eligible (and highly recommended)
		"""
	elsif choice.upcase == "N"
		k1_fiance?()
	else
		refugee?()
	end
end

def k1_fiance?()
	"Are you eligible for a K1 visa (fiance / marriage)?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p """

		Congratulations! You may be eligible for a green card!

		Step 1. Get married within 90 days.

		Step 2. File I-485 to adjust status.

		Step 3.  Receive conditional green card if marriage is
		less than two years old.  File I-751 to remove conditions
		"""
	elsif choice.upcase == "N"
		k3_spouse?()
	else
		k1_fiance?()
	end
end

def k3_spouse?()
	p "Are you eligible for a K3 (spouse) visa?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p """
		Congratulations! You may be eligible for a green card!

		Step 1. File I-485 to adjust status (if I-130 was already filed).

		Step 2. Receive conditional green card if marriage is less than 2
		years old.  File I-751 to remove conditions.
		"""
	elsif choice.upcase == "N"
		dependent?()
	else
		k3_spouse?()
	end
end

def dependent?()
	p "Are you the dependent of a US citizen or green card holder?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p """

		Congratulations! You may be eligible for a green card!

		Follow primary applicant, or start your own process if eligible.
		"""
	elsif choice.upcase == "N"

		p "These are just a few of many options.  As noted before, the law"
		p "changes constantly.  You should consult with an attorney before"
		p "taking taking any legal action."
	else
		dependent?()
	end
end

def what_category?()

	p "What category are you starting the employment-based immigration process under?"

	p """
	Please choose from one of the following.  Use A, B, C or D to select a choice.

	A. EB-1

	B. EB-2

	C. EB-3

	D. EB-4

	E. EB-5
	"""

	choice = gets.chomp

	case choice
		when "A", "a"
			p """

			EB-1

			Priority workers.

			No LC required.  EB-1(a) may file a self petition.
			"""

			visa_number_available_eb?()
		when "B", "b"
			p """

			EB-2

			Workers with advanced degrees or exceptional ability.

			NIW may file self-petition.
			"""

			national_interest_waiver?()
		when "C", "c"
			p """

			EB-3

			Professionals, skilled workers, other workers.
			"""
			employer_LC?()

		when "D", "d"
			p """
			EB-4

			Special workesr - religious, translators, gov. employees, etc.

			Must file I-360, by employer, worker or someone else.

			If approved, you may use I-485 (adjustment of status)

			Or

			Consular Processing.

			"""
		when "E", "e"
			p """
			EB-5

			Investors visa.
			"""

			investor_visa?()

		when "back"
			#placeholder
		else
			what_category?()
	end
end

def national_interest_waiver?()
	puts "Do you qualify for a national interest waiver (NIW)?"

	choice = gets.chomp

	if choice.upcase == "Y"
		visa_number_available_eb?()
	elsif choice.upcase == "N"
		employer_LC?()
	else
		national_interest_waiver?()
	end
end

def visa_number_available_eb?()
	p "Is there a visa number available for you?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "
		Your employer must file an I-140, and you may concurrently file
		I-485 (Adjustment of Status).

		You can also apply for EAD (Employment Authorization Document ) and
		AP (Advanced Parole) along with I-485
		"
		i_140_approved_eb?()
	elsif choice.upcase == "N"
		p "Your employer must file I-140, Immigrant Petition for Alien Worker."

		visa_number_available_eb2?()
	end
end

def i_140_approved_eb?()

	p "Was your I-140 approved?"

	choice = gets.chomp

	if choice.upcase == "Y"
		prefer_consular_processing?()
	elsif choice.upcase == "N"
		uscis_sec_check?
	else
		i_140_approved_eb
	end
end

def prefer_consular_processing?()
	p "Would you prefer, or do you require consular processing?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "Approved I-140 is sent to the National Visa Center (NVC)."

		visa_number_available?()
	elsif choice.upcase == "N"
		uscis_sec_check?()
	else
		prefer_consular_processing?()
	end
end


def uscis_sec_check?()
	p "Did you clear the USCIS security checks?"

	choice = gets.chomp

	if choice.upcase == "Y"
		RFE?()
	elsif choice.upcase == "N"
		p "Wait..."
		p
		p "Was it denied?"

		uscis_sec_check_denied?()
	else
		uscis_sec_check?()
	end
end

def uscis_sec_check_denied?()
	p "Was the USCIS security check denied?"

	choice = gets.chomp

	if choice.upcase == "Y"
		sorry()
	elsif choice.upcase == "N"
		uscis_sec_check?()
	else
		uscis_sec_check_denied?()
	end
end

def RFE?()
	p "Did you receive a request for evidence (RFE)?

	If you are returning to this menu, and you responded in time,

	AND you did NOT receive another RFE, then select no."

	choice = gets.chomp

	if choice.upcase == "Y"
		RFE_in_time?()
	elsif choice.upcase == "N"
		meet_all_reqs_eb?()
	else
		RFE?()
	end
end

def RFE_in_time?()
	p "Did you respond to the Request for Evidence (RFE) in time?"

	choice = gets.chomp

	if choice.upcase == "Y"
		RFE?
	elsif choice.upcase == "N"
		sorry()
	else
		RFE_in_time?()
	end
end

def meet_all_reqs_eb?()
	p "Did you meet all the requirements?"

	choice = gets.chomp

	if choice.upcase == "Y"
		visa_number_available_consular?()
	elsif choice.upcase == "N"
		sorry()
	else
		meet_all_reqs_eb?()
	end
end

def visa_number_available_consular?()
	p "Is there a visa number available?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "Congratulations! You're eligible for a green card!"
	elsif choice.upcase == "N"
		p "Wait..."
		visa_number_available_consular?()
	else
		visa_number_available_consular?()
	end
end


def visa_number_available_eb2?()

		p "Is there a visa number available?"

		choice = gets.chomp

		if choice.upcase == "Y"
			p "You may file I-485 (Adjustment of Status)."

			p "You can also apply for EAD and AP along with I-485."

			i_140_approved?()
		elsif choice.upcase == "N"
			p "Please wait..."
			visa_number_available_eb2?()
		else
			visa_number_available_eb2?()
		end
end

def employer_LC?()
	p "Is your employer willing to file a labor certification on your behalf?"

	choice = gets.chomp

	if choice.upcase == "Y"
		p "Post job ads, interview candidates who meet minimum requirements."
		qualified_US_worker?()
	elsif choice.upcase == "N"
		sorry()
	else
		employer_LC?()
	end
end

def qualified_US_worker?()
	p "Is there a person inside the USA already qualified for this position?"

	choice = gets.chomp

	if choice.upcase == "Y"
		sorry()
	elsif choice.upcase == "N"
		LC_approved?()
	else
		qualified_US_worker?()
	end
end

def LC_approved?()
	p "Was your labor certification approved?"
	choice = gets.chomp

	if choice.upcase == "Y"
		visa_number_available_eb?()
	elsif choice.upcase == "N"
		p "Wait...this could take a while."
		lc_denied?()
	else
		LC_approved?()
	end
end

def lc_denied?()
	p "Was your labor certification denied?"
	choice = gets.chomp

	if choice.upcase == "Y"
		sorry()
	elsif choice.upcase == "N"
		LC_approved?()
	else
		lc_denied?()
	end
end

def relative_US_citizen?() #from family_in_US

	p "Is your relative a US citizen?"
	choice = gets.chomp

	if choice.upcase == "Y"
		spouse_child_orphan?()
	elsif choice.upcase == "N"
		relative_PR?()
	else
		relative_US_citizen?()
	end
end

def relative_PR?() #from relative_USC?
	p "Is your relative a permanent resident of the USA?"
	choice = gets.chomp
	if choice.upcase == "Y"
		spouse_unmarried_child?()
	elsif choice.upcase == "N"
		sorry()
	else
		relative_PR?()
	end
end

def spouse_unmarried_child?()
	p "Are you a spouse or unmarried child?"
	choice = gets.chomp
	if choice.upcase == "Y"
		p """
		You qualify for family-based, immigration 2nd preference (F2);
		you need to wait for a visa number.

		You may be eligible for V visa, and enter the United States to
		wait for your green card process.

		If your sponsor becomes a citizen, they may upgrade your petition from FB-2 to IR.

		In that case, your relative files I-130, Petition for Alien Relative.

			(Now you wait...)

		Once the I-130 is approved, it's sent to the National Visa Center.

		Wait for a visa number to become available (PD currrent).

			(Now you wait again...)

		Once a visa number becomes available, the National Visa Center
		sends out instructions to collect fees and visa application, including
		DS-230 and I-864 (Affidavit of Support).

		The National Visa Center sends the complete package to the embassy or consulate abroad.

		Go through the visa interview.

		You must clear medical exam, security checks, etc.

		Receive immigrant visa, enter the USA as a (conditional) permanent resident.

		GREEN CARD!
		"""
	elsif choice.upcase == "N"
		sorry()
	else
		spouse_unmarried_child?()
	end
end

def i_130_gc()
	p """
	Once a visa number becomes available, the National Visa Center
	sends out instructions to collect fees and visa application, including
	DS-230 and I-864 (Affidavit of Support).

	The National Visa Center sends the complete package to the embassy or consulate abroad.

	Go through the visa interview.

	You must clear medical exam, security checks, etc.

	Receive immigrant visa, enter the USA as a (conditional) permanent resident.

	GREEN CARD!
	"""
end

def spouse_child_orphan?()
	p "Are you a spouse, unmarried child or adopted orphan?"
	choice = gets.chomp

	if choice.upcase == "Y"
		p "You qualify for family-based immigration (immediate relative) and do not need to wait for a visa number
		You relative files I-130, Petition for Alien Relative.

		There are two possible paths to a green card from here.

		1. The spouse / child may apply for K3/K4 visa (I-129F) and enter the USA as a non-immigrant.

		Files I-485 to adjust status and receive your GREEN CARD.

		2. Once a visa number becomes available, the National Visa Center
		sends out instructions to collect fees and visa application, including
		DS-230 and I-864 (Affidavit of Support).

		The National Visa Center sends the complete package to the embassy or consulate abroad.

		Go through the visa interview.

		You must clear medical exam, security checks, etc.

		Receive immigrant visa, enter the USA as a (conditional) permanent resident.

		GREEN CARD!"
	elsif choice.upcase == "N"
		parent_of_USC?()
	else
		spouse_child_orphan?()
	end
end

def parent_of_USC?()
	p "Are you a parent of said US Citizen who is 21 or older?"
	choice = gets.chomp

	if choice.upcase == "Y"
		p "You qualify for family-based immigration (immediate relative) and do not need to wait for a visa number
		You relative files I-130, Petition for Alien Relative.

		There are two possible paths to a green card from here.

		1. The spouse / child may apply for K3/K4 visa (I-129F) and enter the USA as a non-immigrant.

		Files I-485 to adjust status and receive your GREEN CARD.

		2. Once a visa number becomes available, the National Visa Center
		sends out instructions to collect fees and visa application, including
		DS-230 and I-864 (Affidavit of Support).

		The National Visa Center sends the complete package to the embassy or consulate abroad.

		Go through the visa interview.

		You must clear medical exam, security checks, etc.

		Receive immigrant visa, enter the USA as a (conditional) permanent resident.

		GREEN CARD!"
	elsif choice.upcase == "N"
		unmarried_son_daughter_21?()
	else
		parent_of_USC?()
	end
end

def unmarried_son_daughter_21?()
	p "Are you an unmarried son or daughter of a US Citizen?"
	choice = gets.chomp

	if choice.upcase == "Y"

		p "You and your children qualify for family-based 1st preference, you need to wait for a visa number."

		p "Once a visa number becomes available, the National Visa Center
		sends out instructions to collect fees and visa application, including
		DS-230 and I-864 (Affidavit of Support).

		The National Visa Center sends the complete package to the embassy or consulate abroad.

		Go through the visa interview.

		You must clear medical exam, security checks, etc.

		Receive immigrant visa, enter the USA as a (conditional) permanent resident.

		GREEN CARD!"

	elsif choice.upcase == "N"
		married_son_daughter_USC?()
	else
		unmarried_son_daughter_21?()
	end
end

def married_son_daughter_USC?()
	p "Are you a married son or daughter of a US Citizen?"

	choice = gets.chomp

	if choice.upcase == "Y"

		p "You, your spouse and your children qualify for 3rd preference - you need to wait for a visa number."

		p "Once a visa number becomes available, the National Visa Center
		sends out instructions to collect fees and visa application, including
		DS-230 and I-864 (Affidavit of Support).

		The National Visa Center sends the complete package to the embassy or consulate abroad.

		Go through the visa interview.

		You must clear medical exam, security checks, etc.

		Receive immigrant visa, enter the USA as a (conditional) permanent resident.

		GREEN CARD!"
	elsif choice.upcase == "N"
		brother_sister_USC?()
	else
		married_son_daughter_USC
	end
end


	def brother_sister_USC?()
		p "Are you a brother or sister of said US Citizen who is 21 or older?"

		choice = gets.chomp

		if choice.upcase == "Y"
			p "You, your spouse and children qualify for 4th preference - you need to wait for a visa number."

			p "Once a visa number becomes available, the National Visa Center
			sends out instructions to collect fees and visa application, including
			DS-230 and I-864 (Affidavit of Support).

			The National Visa Center sends the complete package to the embassy or consulate abroad.

			Go through the visa interview.

			You must clear medical exam, security checks, etc.

			Receive immigrant visa, enter the USA as a (conditional) permanent resident.

			GREEN CARD!"

	elsif choice.upcase == "N"
		sorry()
	else
		brother_sister_USC?()
	end
end


def sorry()
	p """
	Sorry! Under current US Law you are ineligible for a visa.
	However, as noted before, immigration law is subject to change at any time and
	you should verify any information obtained herein with a licensed attorney.

	Good luck!
	"""
end


start
