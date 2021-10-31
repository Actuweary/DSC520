"""This file contains code used in "Think Stats",
Michael Ersevim
DSC530 Week 9
10/31/2021
11-1
"""

from __future__ import print_function, division

#%matplotlib-inline
import patsy
import re
import nsfg
import numpy as np
import pandas as pd
import random
import thinkstats2
import thinkplot
import regression

import first
live, firsts, others = first.MakeFrames()
live = live[live.prglngth>30] # selects only those in week 30 or later

import statsmodels.formula.api as smf
model = smf.ols('prglngth ~ birthord==1 + race==2 + nbrnaliv>1', data=live)
#models prg length with variables assigned
results = model.fit() #fits model with variables
results.summary()
print(results.summary()) # shows results

'''11-3'''

resp = nsfg.ReadFemResp() #ensures data pulled in
resp.index = resp.caseid
join = live.join(resp, on='caseid', rsuffix='_r')
join.numbabes.replace([97], np.nan, inplace=True)
join['age2'] = join.age_r ** 2 # squares age
formula='numbabes ~ age_r + age2 + age3 + C(race) + totincr + educat'
formula='numbabes ~ age_r + age2 + C(race) + totincr + educat'
model = smf.poisson(formula, data=join) # uses Poisson for counts
results = model.fit()
results.summary()
print(results.summary())# shows results
columns = ['age_r', 'age2', 'age3', 'race', 'totincr', 'educat']
new = pd.DataFrame([[35, 35**2, 35**3, 1, 14, 16]], columns=columns) #assigns new variables
results.predict(new) # predict on new
print(results.predict(new)) # shows results

'''11-4'''

formula='rmarital ~ age_r + age2 + C(race) + totincr + educat'
model = smf.mnlogit(formula, data=join) # uses multi-nomial logit
results = model.fit() #fit model
results.summary()
print(results.summary()) # shows results
columns = ['age_r', 'age2', 'race', 'totincr', 'educat']
new = pd.DataFrame([[25, 25**2, 2, 11, 12]], columns=columns) #assigns variable values
results.predict(new) #fits model with variables
print(results.predict(new))# shows results
