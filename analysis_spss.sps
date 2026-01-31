* ------------------------------------------------------------
* 1. IMPORT DATA 
* ------------------------------------------------------------.
*GET DATA
*  /TYPE=XLSX
*  /FILE='data.xlsx'
*  /SHEET=name 'Sheet1'
*  /READNAMES=ON.
*EXECUTE.


* ------------------------------------------------------------
* 2. MANUAL DATA STRUCTURE
* ------------------------------------------------------------.
*DATA LIST LIST /
*  gender (F1)
*  age (F2)
*  experience (F2)
*  employment (F1)
*  trainingA (F1)
*  trainingB (F1)
*  specialty (F2)
*  grade (F2)
*  pc_in_class (F1)
*  pc_use_level (F1)
*  pc_hours_day (F2)
*  pc_freq_week (F2)
*  create_material (F1)
*  video_audio (F1)
*  internet_use (F1)
*  presentations (F1)
*  teaching_tool (F1)
*  edu_games (F1)
*  edu_software (F1)
*  text_processing (F1)
*  email_use (F1).
*BEGIN DATA.
*END DATA.
*EXECUTE.


* ------------------------------------------------------------
* 3. VARIABLE LABELS
* ------------------------------------------------------------.
VARIABLE LABELS
  gender 'Φύλο'
  age 'Ηλικία'
  experience 'Προϋπηρεσία'
  employment 'Σχέση εργασίας'
  trainingA 'Επιμόρφωση Α επιπέδου'
  trainingB 'Επιμόρφωση Β επιπέδου'
  specialty 'Ειδικότητα'
  grade 'Τάξη διδασκαλίας'
  pc_in_class 'Υπολογιστής στην τάξη'
  pc_use_level 'Βαθμός χρήσης Η/Υ'
  pc_hours_day 'Ώρες χρήσης ανά ημέρα'
  pc_freq_week 'Συχνότητα χρήσης ανά εβδομάδα'
  create_material 'Δημιουργία εκπαιδευτικού υλικού'
  video_audio 'Προβολή βίντεο/μουσικής'
  internet_use 'Αναζήτηση στο διαδίκτυο'
  presentations 'Παρουσιάσεις'
  teaching_tool 'Βοηθητικό εργαλείο διδασκαλίας'
  edu_games 'Εκπαιδευτικά παιχνίδια'
  edu_software 'Εκπαιδευτικά λογισμικά'
  text_processing 'Επεξεργασία κειμένου'
  email_use 'Χρήση email'.
EXECUTE.


* ------------------------------------------------------------
* 4. VALUE LABELS
* ------------------------------------------------------------.
VALUE LABELS
  gender 1 'Άνδρας' 2 'Γυναίκα'
  employment 1 'Μόνιμος' 2 'Αναπληρωτής'
  trainingA 0 'Όχι' 1 'Ναι'
  trainingB 0 'Όχι' 1 'Ναι'
  pc_in_class 0 'Όχι' 1 'Ναι'
  pc_use_level 1 'Καθόλου' 2 'Λίγο' 3 'Αρκετά' 4 'Πολύ'
  create_material 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  video_audio 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  internet_use 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  presentations 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  teaching_tool 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  edu_games 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  edu_software 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  text_processing 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'
  email_use 1 'Ποτέ' 2 'Σπάνια' 3 'Συχνά' 4 'Πολύ συχνά'.
EXECUTE.


* ------------------------------------------------------------
* 5. DESCRIPTIVE STATISTICS (Πίνακες 4.1–4.12)
* ------------------------------------------------------------.
FREQUENCIES VARIABLES=
  gender age experience employment trainingA trainingB specialty grade
  pc_in_class pc_use_level pc_hours_day pc_freq_week
  create_material video_audio internet_use presentations teaching_tool
  edu_games edu_software text_processing email_use
  /ORDER=ANALYSIS.


* ------------------------------------------------------------
* 6. CHI-SQUARE TESTS (Α’ και Β’ επίπεδο επιμόρφωσης)
* ------------------------------------------------------------.

* --- Επιμόρφωση Α' επιπέδου ---.
CROSSTABS
  /TABLES=trainingA BY pc_use_level
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ
  /CELLS=COUNT ROW COLUMN TOTAL.

* --- Επιμόρφωση Β' επιπέδου ---.
CROSSTABS
  /TABLES=trainingB BY pc_use_level
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ
  /CELLS=COUNT ROW COLUMN TOTAL.


* ------------------------------------------------------------
* 7. OPTIONAL GRAPHS
* ------------------------------------------------------------.
GRAPH
  /BAR(GROUPED)=COUNT BY pc_use_level.

GRAPH
  /BAR(GROUPED)=COUNT BY create_material.

