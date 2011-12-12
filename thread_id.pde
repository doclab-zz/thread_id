// -*- mode: c++ -*-

// Arduino Multi-Threading Library (mthread)

// Copyright (C) 2010, 2011 Jonathan Lamothe <jonathan@jlamothe.net>

// This program is free software: you can redistribute it and/or
// modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.

// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see
// <http://www.gnu.org/licenses/>.

// * * *

// This program creates 5 seperate threads which report over serial
// when they're called.  It can be tested by running the program and
// watching the serial console.

#include <newdel.h>
#include <mthread.h>

extern void controlThread(int );


// Our custom Thread:
class ControlThread : public Thread
{
public:
  ControlThread(int id);
protected:
  bool loop();
private:
  int id;
};

ControlThread::ControlThread(int id)
{
  // Set the ID:
  this->id = id;

}

bool ControlThread::loop()
{

  // Die if requested:
  if(kill_flag)
    return false;

  // Print the status message:

   controlThread(id);


  // Sleep for one second:
  sleep(1);
  return true;

}

void setup()
{

  // Create five threads and add them to the main ThreadList:
  for(int i = 1; i <= 5; i++)
    {
      main_thread_list->add_thread(new ControlThread(i));
    }

  // Initialize the serial connection:
  Serial.begin(9600);
  delay(1000);

}

// jl

