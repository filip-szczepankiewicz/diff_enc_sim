## Diffusion Encoding Simulation (diff_enc_sim)

Filip Szczepankiewicz  
Brigham and Women's Hospital, Boston, MA, USA  
Harvard Medical School, Boston, Ma, USA  

### Scope
This code provides a simple framework for visualizing and animating the effect of diffusion encoding on spin along a single direction in space. The code was prepared for the ISMRM 2019 diffusion MRI Educational session: [Diffusion & Microstructure: Fundamentals & Frontiers](https://www.ismrm.org/19/program_files/WE05.htm) for the lecture [Diffusion MRI Acquisition, Part I: From Propagator to Image](https://cds.ismrm.org/protected/19MPresentations/abstracts/E8118.html).

This set of functions can be used to visualize the phase over time for arbitrary field gradients for diffusing particles where the movement can be arbitrarily defined (e.g. based on a gaussian propagator). An assortment of .gif animations is available in the /animations/ folder.

Start by executing the example code, e.g. `des_example_1` which should render the animation below. Note that the code does not include tools for making .gif animations, as this is a bit more involved. I may include this in the future if requested.

### Example
![Example animation](animations/walkon_1.gif)