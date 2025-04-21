# Low-precision feature selection for wearable and microarray data

This repository provides code and results for low-precision feature selection methods applied to wearable sensor and microarray datasets. It includes implementations of mutual information-based algorithms (MIM, JMI and mRMR) with fixed-point optimizations.

---

## Method Implementations

1. **Base Implementation**  
   Folder: [`Base_Implementation`](Base_Implementation)  
   Standard versions of **MIM**, **JMI**, and **mRMR** with fixed-point arithmetic support. Serves as the baseline for comparison.

2. **Logarithmic Division Optimization**  
   Folder: [`Logarithmic_Division`](Logarithmic_Division)  
   Enhanced implementations using fixed-point arithmetic combined with logarithmic division for resource-efficient computations.  

> [!NOTE]  
> The rounding mode can be configured via `f_d_init_round` (e.g., `1` for nearest rounding, `5` for stochastic rounding).

---

## Results
Folder: [`Results`](Results) 
Precomputed results for classifiers **Naive-Bayes** and **C4.5** across datasets and feature selection methods:
- Visualizations of performance metrics (classification accuracy) for MIM, JMI and mRMR.
- Comparisons between baseline and logarithmic division implementations.

---

## Auxiliary Libraries
Folder: [`Utils`](Utils)  
Key components for fixed-point arithmetic:
- **`@fixp`**: MATLAB class for fixed-point number representation.  
- **`fixp`**: Methods for fixed-point operations (addition, multiplication, rounding).  
- **`f_d_floatp`**: Helper functions for the `fixp` class.  

> [!IMPORTANT]  
> The `fixp` and `f_d_floatp` libraries were originally developed by **Gérard Meurant** and adapted by **Samuel Suárez-Marcote**. Documentation: [gerard-meurant.fr](https://gerard-meurant.fr/).
