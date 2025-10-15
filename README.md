## Is there evidence of clonal competition in the production of blood?
The production of blood (hematopoiesis) is a complex and tightly-regulated process that we still don't fully comprehend.

One key observation is that ageing reduces the heterogeneity found in blood.
Our hypothesis is that the reduction in genetic heterogeneity can be partially explain by stem cells competing in a almost fixed-size population.
This repo contains different notebooks providing some evidence for this hypothesis:

*Is clonal competition one of the main driver of the reduction of heterogeneity observed in ageing healthy individuals?*

## Instructions
To run the notebooks:
1. install [`uv`](https://docs.astral.sh/uv/getting-started/installation/)
2. `uv run python -m ipykernel install --user --name hsc-figures`
3. Then, if on a HPC using an On Demand service option a ELSE option b:
   
    a. connect to jupyter lab and select the correct kernel `hsc-figures` OR
   
    b. `uv run jupyter lab`

For more informations, see also [here](https://github.com/fraterenz/hsc-figures/blob/master/inferences/README.md).
