# RKF-AGST
This repository is for the code of the ICASSP 2026 paper: "Robust Kalman Filter for Additive Gaussian-Student's t Distribution".
# Problem Scenario and Definition

## Background

Traditional Kalman filtering has notable limitations when dealing with system and measurement noise:

- **Kalman Filter**: Limited to Gaussian noise assumptions
- **Other Robust Filters**: Typically handle only a single type of noise

In contrast, the proposed method addresses more complex **mixed-noise scenarios**, specifically combinations of Gaussian and non-Gaussian noise (such as GSM-typical non-Gaussian noise).

## Problem Definition

The observation model is expressed as:

$$
z = h(x) + n_1 + n_2
$$

where the noise components are:

1. **Gaussian noise**: $n_1 \sim \mathcal{N}(0, \sigma^2)$
2. **Student's t-distribution noise**: $n_2 \sim \mathcal{St}(0, \nu, \sigma^2)$

## Noise Handling Strategies Across Filtering Methods

### 1. Kalman Filter Approach
Assumes mixed noise can be approximated as a single Gaussian distribution:

$$
n_1 + n_2 \sim \mathcal{N}(0, \sigma^2) + \mathcal{St}(0, \nu, \sigma^2) \approx \mathcal{N}(0, \sigma^2_{\text{new}})
$$

This method simplifies the mixed noise to Gaussian by re-estimating the variance parameter.

### 2. Other Robust Filter Approaches
Assume mixed noise can be approximated as a single Student's t-distribution:

$$
n_1 + n_2 \sim \mathcal{N}(0, \sigma^2) + \mathcal{St}(0, \nu, \sigma^2) \approx \mathcal{St}(0, \nu_{\text{new}}, \sigma^2_{\text{new}})
$$

This approach simplifies the mixed noise to a t-distribution by adjusting the degrees of freedom and scale parameters.

### 3. Proposed Method
**Preserves the original forms of both noise components**, directly studying the true distribution of the mixed noise:

$$
n_1 + n_2 \sim \mathcal{N}(0, \sigma^2) + \mathcal{St}(0, \nu, \sigma^2)
$$

This method avoids distributional simplification and directly addresses the complex characteristics of mixed noise, theoretically providing better adaptation to complex noise environments in practical systems.

---

**Note**: Symbol definitions
- $\mathcal{N}(\mu, \sigma^2)$: Gaussian/Normal distribution with mean $\mu$ and variance $\sigma^2$
- $\mathcal{St}(\mu, \nu, \sigma^2)$: Student's t-distribution with location parameter $\mu$, degrees of freedom $\nu$, and scale parameter $\sigma$
- $h(x)$: Nonlinear mapping function from state to observation


## Acknowledgement
I would like to express my sincere gratitude to Prof. Zhenyu and Prof. Xiao-Ping for their invaluable research guidance and insightful revision feedback on this manuscript.

This work originated from my course project on "Bayesian Learning". I have since further developed and expanded upon that early version. I would also like to thank our course teacher, Prof. Ercan, and the technical assistant, Dr. Pengcheng, for their valuable input and assistance during and after the course.

## Citation
```
@inproceedings{RKFAGST,
  title={Robust Kalman Filter for Additive Gaussian-Student's t Distribution},
  author={Jin, Gurui and Hao, Pengcheng and Liu, Zhenyu and Zhang, Xiao-Ping and Kuruo{\u{g}}lu, Ercan Engin},
  booktitle={2026 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)},
  year={2026}
}
```
