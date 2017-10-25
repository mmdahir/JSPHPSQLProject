CREATE DATABASE dahir_mustaf_db;
USE dahir_mustaf_db;

CREATE TABLE Account (
	Username varchar(25) NOT NULL,
    Password varchar(50) NOT NULL,
    CONSTRAINT Account_PK PRIMARY KEY(Username)
    );

CREATE TABLE PhoneNumber (
	PhoneNumberID Integer NOT NULL AUTO_INCREMENT, 
    PhoneNumber varchar(20) NOT NULL,
    PhoneType varchar(20),
    CONSTRAINT PhoneNumber_PK PRIMARY KEY(PhoneNumberID)
    );
    
    CREATE TABLE Contact (
	ContactID Integer NOT NULL AUTO_INCREMENT, 
    PhoneNumberID Integer,
    Email varchar(40),
    CONSTRAINT Contact_PK PRIMARY KEY(ContactID),
    CONSTRAINT Phone_Relationship FOREIGN KEY(PhoneNumberID)
		REFERENCES PhoneNumber(PhoneNumberID)
    );

	CREATE TABLE Address (
	AddressID Integer NOT NULL AUTO_INCREMENT,
    Address1 varchar(25),
	Address2 varchar(25),
    City varchar(25),
    State varchar(25),
    Zip Integer,
    CONSTRAINT Address_PK PRIMARY KEY(AddressID)
    );
    
CREATE TABLE GymUser (
	GymUserID Integer NOT NULL AUTO_INCREMENT, 
    AddressID Integer,
    Username varchar(25) NOT NULL,
    ContactID Integer, 
    CONSTRAINT GymUser_PK PRIMARY KEY(GymUserID),
    CONSTRAINT Account_User_Relationship FOREIGN KEY(Username)
		REFERENCES Account(Username),
	CONSTRAINT Address_Relationship FOREIGN KEY(AddressID)
		REFERENCES Address(AddressID),
	CONSTRAINT Contact_Relationship FOREIGN KEY(ContactID)
		REFERENCES Contact(ContactID)
    );

CREATE TABLE PersonalTrainer (
	TrainerID Integer NOT NULL AUTO_INCREMENT, 
    Username varchar(25) NOT NULL,
    ContactID Integer,
    CONSTRAINT Trainer_PK PRIMARY KEY(TrainerID),
    CONSTRAINT Account_Trainer_Relationship FOREIGN KEY(Username)
		REFERENCES Account(Username),
	CONSTRAINT Contact_Trainer_Relationship FOREIGN KEY(ContactID)
		REFERENCES Contact(ContactID)
    );

CREATE TABLE Gym (
	GymID Integer NOT NULL AUTO_INCREMENT, 
    GymName varchar(25) NOT NULL,
    AddressID Integer,
    ContactID Integer,
    CONSTRAINT Gym_PK PRIMARY KEY(GymID),
    CONSTRAINT Gym_Address_Relationship FOREIGN KEY(AddressID)
		REFERENCES Address(AddressID),
	CONSTRAINT Contact_Gym_Relationship FOREIGN KEY(ContactID)
		REFERENCES Contact(ContactID)
    );

CREATE TABLE Physique (
	GymUserID Integer NOT NULL,
	Weight Integer NOT NULL,
    Height Integer NOT NULL,
    BodyFatPercentage Integer NOT NULL,
    CONSTRAINT Physique_PK PRIMARY KEY(GymUserID),
    CONSTRAINT GymUser_Physique_Relationship FOREIGN KEY(GymUserID)
		REFERENCES GymUser(GymUserID)
    );

CREATE TABLE GymHours (
	GymID Integer NOT NULL,
    GymHoursID Integer NOT NULL AUTO_INCREMENT, 
    OpenTime TIME,
    CloseTime TIME,
    IsWeekend BOOLEAN,
    CONSTRAINT GymHours_PK PRIMARY KEY(GymID, GymHoursID),
    CONSTRAINT Gym_Hours_Relationship FOREIGN KEY(GymID)
		REFERENCES Gym(GymID)
    );
    
CREATE TABLE TrainerHours (
	TrainerID Integer NOT NULL,
    TrainerHoursID Integer NOT NULL AUTO_INCREMENT, 
    StartTime TIME,
    EndTime TIME,
    WorkDate DATE,
    CONSTRAINT TrainerHours_PK PRIMARY KEY(TrainerID, TrainerHoursID),
    CONSTRAINT Trainer_Hours_Relationship FOREIGN KEY(TrainerID)
		REFERENCES PersonalTrainer(TrainerID)
    );
    
CREATE TABLE Membership (
	GymID Integer NOT NULL,
    GymUserID Integer NOT NULL,
    StartDate DATE,
    IsRecurring BOOLEAN NOT NULL,
    CONSTRAINT Membership_PK PRIMARY KEY(GymID, GymUserID),
    CONSTRAINT GymUser_Membership_Relationship FOREIGN KEY(GymUserID)
		REFERENCES GymUser(GymUserID),
	CONSTRAINT Gym_Membership_Relationship FOREIGN KEY(GymID)
		REFERENCES Gym(GymID)
    );

CREATE TABLE TrainerEmployment (
	GymID Integer NOT NULL,
    TrainerID Integer NOT NULL,
    StartDate DATE,
    CONSTRAINT TrainerEmployment_PK PRIMARY KEY(GymID, TrainerID),
    CONSTRAINT Trainer_Employment_Relationship FOREIGN KEY(TrainerID)
		REFERENCES PersonalTrainer(TrainerID),
    CONSTRAINT Gym_Employment_Relationship FOREIGN KEY(GymID)
		REFERENCES Gym(GymID)
    );

CREATE TABLE Appointment (
	TrainerID Integer NOT NULL,
    GymUserID Integer NOT NULL,
    AppointmentDate DATE NOT NULL,
    StartTime TIME,
    EndTime TIME,
    CONSTRAINT Appointment_PK PRIMARY KEY(TrainerID, GymUserID, AppointmentDate),
    CONSTRAINT GymUser_Appointment_Relationship FOREIGN KEY(GymUserID)
		REFERENCES GymUser(GymUserID),
	CONSTRAINT Trainer_Appointment_Relationship FOREIGN KEY(TrainerID)
		REFERENCES PersonalTrainer(TrainerID)  
    );

CREATE TABLE FoodPlan (
	FoodPlanID Integer NOT NULL AUTO_INCREMENT,
    CaloriesIntake Integer,
    ProteinIntake Integer,
    CarbsIntake Integer,
    CONSTRAINT FoodPlan_PK PRIMARY KEY(FoodPlanID)
    );

CREATE TABLE FitnessPlan (
	FitnessPlanID Integer NOT NULL AUTO_INCREMENT,
	TrainerID Integer,
    GymUserID Integer,
    FoodPlanID Integer,
    CONSTRAINT FitnessPlan_PK PRIMARY KEY(FitnessPlanID),
    CONSTRAINT GymUser_Plan_Relationship FOREIGN KEY(GymUserID)
		REFERENCES GymUser(GymUserID),
	CONSTRAINT Trainer_Plan_Relationship FOREIGN KEY(TrainerID)
		REFERENCES PersonalTrainer(TrainerID),
	CONSTRAINT FoodPlan_Relationship FOREIGN KEY(FoodPLanID)
		REFERENCES FoodPlan(FoodPlanID)
    );

CREATE TABLE Workout (
	FitnessPlanID Integer NOT NULL,
    WorkoutID Integer NOT NULL AUTO_INCREMENT,
    WorkoutName varchar(25),
    WorkoutType varchar(25),
    Recurrence Integer,
    CONSTRAINT Workout_PK PRIMARY KEY(WorkoutID),
    CONSTRAINT FitnessPlan_Relationship FOREIGN KEY(PlanID)
		REFERENCES FitnessPlan(FitnessPlanID) 
    );

CREATE TABLE ToolsNeeded (
	WorkoutID Integer NOT NULL,
    ToolName varchar(25),
    Weight Integer,
    CONSTRAINT ToolsNeeded_PK PRIMARY KEY(WorkoutID, ToolName),
    CONSTRAINT Workout_Relationship FOREIGN KEY(WorkoutID)
		REFERENCES Workout(WorkoutID) 
    );