# RKF-AGST
This repository is for the code of the ICASSP 2026 paper: "Robust Kalman Filter for Additive Gaussian-Student's t Distribution".

## Key Innovation
Traditional Kalman filtering has notable limitations when dealing with system and measurement noise:

- **Kalman Filter**: Limited to Gaussian noise assumptions
- **Other Robust Filters**: Typically handle only a single type of noise

In contrast, the proposed method addresses more complex **mixed-noise scenarios**, specifically combinations of Gaussian and non-Gaussian noise (such as GSM-typical non-Gaussian noise).

### Problem Definition

The observation model is expressed as:
z = h(x) + n₁ + n₂
where the noise components are:

1. **Gaussian noise**: `n₁ ∼ 𝒩(0, σ²)`
2. **Student's t-distribution noise**: `n₂ ∼ 𝒮𝓉(0, ν, σ²)`

### Noise Handling Strategies Across Filtering Methods

#### 1. Kalman Filter Approach
Assumes mixed noise can be approximated as a single Gaussian distribution:
This method simplifies the mixed noise to Gaussian by re-estimating the variance parameter.

#### 2. Other Robust Filter Approaches
Assume mixed noise can be approximated as a single Student's t-distribution:
This approach simplifies the mixed noise to a t-distribution by adjusting the degrees of freedom and scale parameters.

#### 3. Proposed Method
**Preserves the original forms of both noise components**, directly studying the true distribution of the mixed noise:
This method avoids distributional simplification and directly addresses the complex characteristics of mixed noise, theoretically providing better adaptation to complex noise environments in practical systems.

---

**Note**: Symbol definitions
- `𝒩(μ, σ²)`: Gaussian/Normal distribution with mean μ and variance σ²
- `𝒮𝓉(μ, ν, σ²)`: Student's t-distribution with location parameter μ, degrees of freedom ν, and scale parameter σ
- `h(x)`: Nonlinear mapping function from state to observation


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
