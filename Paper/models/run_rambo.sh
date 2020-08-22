#! /bin/sh

slash="/"

group_number=7
group='Grp'
print $group$group_number
#output_destination='/home/jagan/Dropbox/Self-driving-car-Results/Rambo/Results/TestDataset' # to run test dataset
output_destination='/home/jagan/Dropbox/Self-driving-car-Results/Rambo/Results/2-way/Grp'$group_number

for d in $(find '/home/jagan/Desktop/Rambo/2-way/Grp'$group_number$slash -maxdepth 1 -type d | natsort)

do
  file_name=$(basename $d)  # to print the folder name --- https://stackoverflow.com/a/3362952
  #directory_name=$d
  if [ $file_name !=  $group$group_number ]
  then
    echo $d
    echo $group_number
    echo $file_name  # transformation_name
    echo $output_destination
    echo '*********'
    export KERAS_BACKEND=theano # changing the backend to Theano
    python2 run_rambo.py --dataset $d --group $group_number --file_type $file_name --output_path $output_destination
  fi
done

##d='/home/jagan/Desktop/Baseline/center/'  # to run test dataset
#d='/home/jagan/Desktop/Rambo/Baseline/Grp'$group_number$slash
#file_name='baseline'
#export KERAS_BACKEND=theano # changing the backend to Theano
#python2 run_rambo.py --dataset $d --group $group_number --file_type $file_name --output_path $output_destination