## Diffusion Encoding Simulation (diff_enc_sim)

Filip Szczepankiewicz (filip.szczepankiewicz@med.lu.se)  

Brigham and Women's Hospital, Boston, MA, USA  
Harvard Medical School, Boston, Ma, USA  
Lund University, Lund, Sweden  

### Scope in 2019
This code provides a simple framework for visualizing and animating the effect of diffusion encoding on spin along a single direction in space. The code was prepared for the ISMRM 2019 diffusion MRI Educational session: [Diffusion & Microstructure: Fundamentals & Frontiers](https://www.ismrm.org/19/program_files/WE05.htm) for the lecture [Diffusion MRI Acquisition, Part I: From Propagator to Image](https://cds.ismrm.org/protected/19MPresentations/eduvids/11/710B/0845/) (login is required to access the lecture video).

This set of functions can be used to visualize the phase over time for arbitrary field gradients for diffusing particles where the movement can be arbitrarily defined (e.g. based on a gaussian propagator). An assortment of .gif animations is available in the /animations/ folder.

Start by executing the example code, e.g. `des_example_1` which should render the animation below.

### Scope in 2022
The repository was slightly extended in preparation for the ISMRM 2022 diffusion MRI Educational session: Diffusion: From Basic to Advanced, for the lecture [Encoding Diffusion: Advanced gradient design and relaxation-weighting](https://submissions.mirasmart.com/ISMRM2022/Itinerary/ConferenceMatrixEventDetail.aspx?ses=WE-06).

Among other improvements, there is now code that creates gifs from images in a folder or cell structure. See the function `des_imgl2gif`. For best results, start from images in a folder, where the images are saved at a high resolution. You can do this by using custom image write scripts. For example `fix_save_figure` [from this GitHub repo](https://github.com/filip-szczepankiewicz/fix_matlab).

The code now also includes animations that show the effects of varying the echo time, repetition time and inversion time. Moreover, there are animations that show the confounding effects caused by concomitant gradients and cross-terms with background gradients.

### Example animation
![Example animation](animations/walkon_1.gif)
