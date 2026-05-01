## File Descriptions

| File | Description |
|------|-------------|
| `calculate_loss.m` | Computes cumulative RMSE, MAE, and ANEES given ground truth positions, estimated states, and error covariance matrices. |
| `GMrnd.m` | Generates samples from a Gaussian mixture distribution (two components with different scales), used for simulating contaminated Gaussian noise. |
| `GSTrnd.m` | Generates additive noise consisting of a Gaussian component plus a Student's t component. Used to create AGST-distributed measurement noise. |
| `main_test.m` | Main experiment script. Runs 1000 Monte Carlo simulations for all filters (KF, PF, RKF‑Gaussian, RKF‑ST, and the proposed RKF‑AGST). Accumulates loss metrics and runtime. |
| `plotCurve.m` | Plots RMSE and MAE over time for all compared filters, generating the curves shown in Figure 2 of the paper. |
| `stpdf.m` | Computes the probability density function of a multivariate Student's t distribution. Used in the PF update step. |
| `test_demo.m` | Standard Kalman filter implementation assuming Gaussian measurement noise. Serves as a baseline. |
| `test_demoPF.m` | Particle filter with Student's t likelihood. Uses systematic resampling and estimates state as weighted mean of particles. |
| `test_demoPF3.m` | Particle filter with Gaussian likelihood, included for comparison to show the effect of heavy‑tailed assumptions. |
| `test_demoRKFAGSMG.m` | **Proposed RKF‑AGST algorithm.** Implements variational Bayesian inference for state estimation under additive Gaussian‑Student's t measurement noise. Handles hybrid noise environments. |
| `test_demoRKFGaussian.m` | Robust Kalman filter that assumes Gaussian noise but adaptively estimates the measurement covariance using an inverse‑Wishart prior. |
| `test_demoRKFST.m` | Robust Kalman filter based on the Student's t distribution (RKF‑ST). Uses a hierarchical Gaussian formulation and EM‑like updates. |
| `Traj_Poly.m` | Generates a target trajectory (constant velocity model) and synthetic measurements corrupted by AGST noise. Returns both true positions and observations. |
