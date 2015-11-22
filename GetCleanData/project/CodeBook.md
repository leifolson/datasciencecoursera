#Project Code Book

## Data Description from original source (see source link below):
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Original Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#


## Data Transformation and Cleanup:
Transformed data can be obtained through the run_analysis.R script.

Table layout include observations in rows and variables in columns.

### Data Transformation Steps:
* Training and test data sets were combined into a single table along with the subject id and activity target values.
* Only variables corresponding to mean or standard deviation calculations were retained.
* The mean value of each retained variable was calculated for each subject, activity pair.
* No other manipulation of variable values was performed.

### Data Cleanup Steps:
* All varible names were refactored into more readable language.
* Activity ID values were subtituted with descriptive activity names.


## Variable descriptions
All columns except for subject and activity are mean calculations for the following variables:
* Body Acceleration: body acceleration signal
* Body Gyro: body gyroscope signal
* Gravity Acceleration: gravity acceleration signal

FFT indicates a Fast Fourier Transform of the signal indicated and Jerk indicates the jerk signal obtained by deriving acceleration and angular velocity.
Mag indicates the magnitude of the signal and the X,Y, and Z notations indicate the direction of the movement.  Additionally, Mean and Std have the standard meanings of the mean value of the variable and the standard deviation.

## Complete list of feature variables in the processed dataset obtained from the run_analysis.R script:
subject                                       
activity                                     
Mean: Body Acceleration Mean-X                
Mean: Body Acceleration Mean-Y               
Mean: Body Acceleration Mean-Z                
Mean: Body Acceleration Std-X                
Mean: Body Acceleration Std-Y                 
Mean: Body Acceleration Std-Z                
Mean: Gravity Acceleration Mean-X             
Mean: Gravity Acceleration Mean-Y            
Mean: Gravity Acceleration Mean-Z             
Mean: Gravity Acceleration Std-X             
Mean: Gravity Acceleration Std-Y              
Mean: Gravity Acceleration Std-Z             
Mean: Body Acceleration Jerk Mean-X           
Mean: Body Acceleration Jerk Mean-Y          
Mean: Body Acceleration Jerk Mean-Z           
Mean: Body Acceleration Jerk Std-X           
Mean: Body Acceleration Jerk Std-Y            
Mean: Body Acceleration Jerk Std-Z           
Mean: Body Gyro Mean-X                        
Mean: Body Gyro Mean-Y                       
Mean: Body Gyro Mean-Z                        
Mean: Body Gyro Std-X                        
Mean: Body Gyro Std-Y                         
Mean: Body Gyro Std-Z                        
Mean: Body Gyro Jerk Mean-X                   
Mean: Body Gyro Jerk Mean-Y                  
Mean: Body Gyro Jerk Mean-Z                   
Mean: Body Gyro Jerk Std-X                   
Mean: Body Gyro Jerk Std-Y                    
Mean: Body Gyro Jerk Std-Z                   
Mean: Body Acceleration Mag Mean              
Mean: Body Acceleration Mag Std              
Mean: Gravity Acceleration Mag Mean           
Mean: Gravity Acceleration Mag Std           
Mean: Body Acceleration Jerk Mag Mean         
Mean: Body Acceleration Jerk Mag Std         
Mean: Body Gyro Mag Mean                      
Mean: Body Gyro Mag Std                      
Mean: Body Gyro Jerk Mag Mean                 
Mean: Body Gyro Jerk Mag Std                 
Mean: FFT Body Acceleration Mean-X            
Mean: FFT Body Acceleration Mean-Y           
Mean: FFT Body Acceleration Mean-Z            
Mean: FFT Body Acceleration Std-X            
Mean: FFT Body Acceleration Std-Y             
Mean: FFT Body Acceleration Std-Z            
Mean: FFT Body Acceleration Jerk Mean-X       
Mean: FFT Body Acceleration Jerk Mean-Y      
Mean: FFT Body Acceleration Jerk Mean-Z       
Mean: FFT Body Acceleration Jerk Std-X       
Mean: FFT Body Acceleration Jerk Std-Y        
Mean: FFT Body Acceleration Jerk Std-Z       
Mean: FFT Body Gyro Mean-X                    
Mean: FFT Body Gyro Mean-Y                   
Mean: FFT Body Gyro Mean-Z                    
Mean: FFT Body Gyro Std-X                    
Mean: FFT Body Gyro Std-Y                     
Mean: FFT Body Gyro Std-Z                    
Mean: FFT Body Acceleration Mag Mean          
Mean: FFT Body Acceleration Mag Std          
Mean: FFT BodyBody Acceleration Jerk Mag Mean 
Mean: FFT BodyBody Acceleration Jerk Mag Std 
Mean: FFT BodyBody Gyro Mag Mean              
Mean: FFT BodyBody Gyro Mag Std              
Mean: FFT BodyBody Gyro Jerk Mag Mean         
Mean: FFT BodyBody Gyro Jerk Mag Std 





