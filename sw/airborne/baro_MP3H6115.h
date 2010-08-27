/*
 * $Id: baro_MS5534A.h,v 1.3 2008/01/29 17:52:00 poine Exp $
 *  
 * Copyright (C) 2008  Hochschule Bremen
 *
 * This file is part of paparazzi.
 *
 * paparazzi is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * paparazzi is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with paparazzi; see the file COPYING.  If not, write to
 * the Free Software Foundation, 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA. 
 *
 */

/** \file baro_MP3H6115.h
 *  \brief Handling of the MP3H6115 pressure sensor
 *
 */

#ifndef BARO_MP3H6115_H
#define BARO_MP3H6115_H

#include "std.h"

extern bool_t alt_baro_enabled;
extern float baro_MP3H6115_rel_height;

#ifdef USE_BARO_MP3H6115

// some defines for pre calculation, move them maybe to airframe.xml
// values taken from international height formula
#define PRESSURE_OCEAN_TEMP 288.15               // dim -> kelvin
#define PRESSURE_TEMP_GRAD_PER_100M 0.0065       // 0.65 K / 100 m
#define TEMP_PER_GRADIENT (PRESSURE_OCEAN_TEMP / PRESSURE_TEMP_GRAD_PER_100M)  // dim -> meter
#define ATMO_PRESSURE 1013.25   // dim -> hPa


extern bool_t baro_MP3H6115_available;

extern float baro_MP3H6115_ground_height;
extern float baro_MP3H6115_volt; 
extern float baro_MP3H6115_off_volt; 

// Values for estimator
extern float baro_MP3H6115_r;
extern float baro_MP3H6115_sigma2;
extern float baro_MP3H6115_z;

void baro_MP3H6115_init( void );
void baro_MP3H6115_calibrate( void );
void baro_MP3H6115_event_task( void );

#endif // USE_BARO_MP3H6115

#endif // BARO_MP3H6115_H