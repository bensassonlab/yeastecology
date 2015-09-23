# yeastecology
Data, field photos and manuscripts on yeast ecology

The **manuscript** directory contains LaTeX files and pdfs for the submission to bioRxiv.

Photographs of oak trees and fig trees sampled for yeast from 2006-2011 are in the **fieldphotos** directory. Used together with the longitude and latitude coordinates, these can be used to identify host plants, so that it is possible for others to resample the same host individuals. These photos were taken by Ana Pinharanda, Douda Bensasson and Dan Smith. 

The **data** directory contains the following:

- All 371 DNA sequences analysed in the Robinson et al manuscript are in **Robinson_etalAllSeqs.fa**. Most of these (300) were submitted to GenBank (KT206983-KT207282). Bases with phred-scaled score below 40 are shown as "N".

- **supplemental_file_2.tsv** A .tsv file that summarises the BLAST results for the 371 DNA sequences generated for this study, the species call of the associated yeast strains, and NCBI accession numbers. The query name is the name of the DNA sequence query as it appears in blast outputs; DBuid is the unique identification number in the Bensasson lab yeast collection; "classification" describes how we classified this sequence for the purpose of our statistical analysis; Ascore is the highest BLAST score when queried against Ascomycota at NCBI; Evalue is the E value associated with this; Cscore and Pscore are the highest BLAST scores when queried against *S. cerevisiae* and *S. paradoxus* respectively. Some DNA sequences were not submitted to NCBI. These were 71 DNA sequences that were technical replicates, contained more than 100 low quality bases (bases with phred-scaled score below 40) or that had fewer than 200 high quality bases and are available in **Robinson_etalAllSeqs.fa**. Samples with the suffix ".SM" and ".YM" for strainUID may contain multiple yeast strains, because they were grown from several colonies each from a Sniegowski selection plate or a YPD plate respectively. All other strains were grown from a single colony.

- **supplemental_file_3.tsv** A .tsv file that summarises the presence or absence of  *S. cerevisiae* (Scer), *S. paradoxus* (Spar), other yeast that is amplified by primers in the ITS region (otherAmplifiedITS), or other microbial growth (otherGrowth) for every sample collected for this study. This table also includes a description of each sample substrate (e.g. fig, bark, must), field collection date (fieldDate), sample weight (in grams), isolation temperature (degrees Celsius), the name of the collection site, the species name of the host plant, latitude and longitude (WGS84 format), elevation (in metres), trunk girth (in metres) and pH of soil at base of host where available. 

- **supplemental_file_4.tsv** A .tsv file with details of 301 *S. cerevisiae* and 246 *S. paradoxus* isolates and the geographic locations from which they were sampled. Genotype information is included where it is available. In cases where latitude and longitude were estimated from Google Maps, we include the Google search term used. Where site descriptions cover a large region (e.g. a country name) we selected a point in the centre of that possible region. Yeast isolates with site descriptions that did not allow location within 100-200 km were omitted from this summary. In the case of the *S. paradoxus* strains described in (Zhang et al 2010), strain names were not reported, so they are all listed as "SpNZ". In Cromie et al (2013), no strains were classified as admixed (or "mosaics") even though many of the same strains were classified this way in other studies (Liti et al 2009), we therefore used the data in Cromie et al (2013) to classify mosaics (those assigned to a single population by InStruct with a probability lower than 0.9375; 15 out of 16 chromosomes). The estimated Tmax (in degrees Celsius * 10) for the field site of each strain is shown along with the longitude (TmaxLon) and latitude (TmaxLat) coordinates of the a closest pixel to our estimate of site location at 30 arc-second (approximately 1km) resolution from the WorldClim dataset version 1.4 (1950-2000, release 3, http://www.worldclim.org). However, the positioning of almost all sites is approximate (up to the nearest 100-200km).
