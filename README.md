## Extended Kalman Filter (EKF)
<br />

*This is a class project which create a <a href="https://en.wikipedia.org/wiki/Extended_Kalman_filter">extended Kalman filter (EKF)</a>*<br />
*The plant model and the measurement model are non-linear in this project*
<br />
<br />

---
#### Matrix Gt obtained after linearizing the plant model
<br />


<a href="https://github.com/MarkZeng222/EKF/blob/master/plant_jacobian.m">function G = plant_jacobian(xs)</a>


*returns the plant model Jacobian matrix G evaluated at xs*  
*parameter xs is <a href="https://imgbb.com/"><img src="https://image.ibb.co/k7siTz/Screen_Shot_2018_07_31_at_6_10_03_PM.png" alt="Screen Shot 2018 07 31 at 6 10 03 PM" border="0" height="45" width="45"/></a> the estimated location of the robot at time t − 1*
<br />
<br />

---

#### Matrix Ht obtained after linearizing the measurement model
<br />


<a href="https://github.com/MarkZeng222/EKF/blob/master/meas_jacobian.m">function H = meas_jacobian(xt)</a>


*returns the measurement model Jacobian matrix H evaluated at xt*<br />
*parameter xt is <a href="https://imgbb.com/"><img src="https://image.ibb.co/hmx6gK/Screen_Shot_2018_07_31_at_6_12_21_PM.png" alt="Screen Shot 2018 07 31 at 6 12 21 PM" border="0" height="45" width="35"/></a> predicted location of the robot at time t*
<br />
<br />

---

#### Extended Kalman Filter (EKF)
<br />


<a href="https://github.com/MarkZeng222/EKF/blob/master/ekf.m">function [mu, Sigma] = ekf(mu, Sigma, u, z)</a>


*returns the estimated state mu and covariance matrix Sigma at time t given the estimated state mu at time (t − 1)*
*parameter Sigma - estimated covariance Sigma at time (t − 1)*<br />
*parameter u - the control input u at time t*<br />
*parameter z -  the observation z at time t*
<br />
<br />

---

#### Tester<br />
*EKF at each time step t = 0, 1, 2, ..., 25, estimate state covariance Σ0 = <a href="https://imgbb.com/"><img src="https://image.ibb.co/jjCTve/Screen_Shot_2018_07_31_at_6_06_22_PM.png" alt="Screen Shot 2018 07 31 at 6 06 22 PM" border="0" height="45" width="45"/></a>*
																		                                 	
*true starting position of the robot is Xtrue = transpose([0 2])*<br />

##### Estimates of the starting location x0
<br />

```
x0 = transpose([0 9])
```

<a href="https://ibb.co/mHbP1K"><img src="https://preview.ibb.co/dAVj1K/Screen_Shot_2018_03_23_at_2_15_54_AM.png" alt="Screen Shot 2018 03 23 at 2 15 54 AM" border="0" height="340" width="400"/></a>
<br />

```
x0 = transpose([0 -5])
```

<a href="https://ibb.co/hX4BgK"><img src="https://preview.ibb.co/n28tve/Screen_Shot_2018_03_23_at_2_17_03_AM.png" alt="Screen Shot 2018 03 23 at 2 17 03 AM" border="0" height="340" width="400"/></a>

#### The two different starting points produce such different results

*The estimating goes wrong iff when y axis of starting point (xl) is negative value. In general, the initial values only affect the convergence rate of* *EKF model (i.e. xˆ0 is not close to x0); however, if P0 (note 1) is chosen too small while xˆ0 and x0 differ considerably, the estimator relies on the* *model predictions more than it should. Therefore, subsequent measurements do not have the impact on the estimator that they need to have. The filter* *might learn the wrong state too well and diverge. (In this case, xl cause the filter diverge when it becomes negative)*

*note1: P0 =diag (xˆ0−x0)T(xˆ0−x0)  initialize EKF model with this equation gives good estimation result*
*estimate of initial state: x0 = [xu  xl]T*
*xˆ0 is a suitable initial state guess, P0 is uncertainty of initial state estimate covariance matrix*

