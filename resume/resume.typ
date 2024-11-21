#import "template.typ": resume, header, resume_heading, edu_item, exp_item, project_item, skill_item

#show: resume

#header(
  name: "Mark Schulist",
  phone: "4152093361",
  email: "mschulist2@gmail.com",
  linkedin: "linkedin.com/in/mark-schulist-65090a286",
)

#resume_heading[Education]
#edu_item(
  name: "Washington University in St. Louis",
  degree: "BS in Computer Science",
  location: "St. Louis, MO",
  date: "Aug 2023 - May 2027",
)


#resume_heading[Experience]
#exp_item(
  role: "Data Science Intern",
  location: "",
  name: "SeerAI",
  date: "May 2024 - Present",
  [Leveraged the Geodesic spatiotemporal platform via Python API and ArcGIS Online],
  [Wrote band arithmetic and inverse distance weighting middlewares in Go, utilizing expression parsing and K-D trees respectively],
)
#exp_item(
  role: "Research Assistant",
  name: "California Academy of Sciences",
  location: "San Francisco, CA",
  date: "Aug 2021 - Present",
  [Developed a data pipeline to train a custom bird vocalization classifier using the #link("https://github.com/google-research/perch", [Google Perch]) library],
  [Significantly improved the precision and recall of the classifier by fine-tuning the model on our own data],
  [Created simulations to test a Bayesian hierarchical occupancy model in R/JAGS],
  [Conducted avian point counts in Eldorado National Forest for the past three summers],
)
#exp_item(
  role: "Web Developer",
  name: "California Academy of Sciences",
  location: "San Francisco, CA",
  date: "Jun 2023 - Aug 2023",
  [Created a website to teach researchers about food webs for a wildlife metrics project],
  [Developed the website to secure a grant extension],
)
// #exp_item(
//   role: "Sales Associate",
//   name: "Wild Birds Unlimited",
//   location: "Novato, CA",
//   date: "Mar 2019 - Aug 2023",
//   [Received shipments from suppliers],
//   [Assisted customers in selecting bird feeders for their backyard]
// )

#resume_heading("Projects")
#project_item(
  name: "Perch Agile Modeling",
  skills: "NextJS, FastAPI, SQLite, Python, Google Cloud",
  date: "May 2024 - Present",
  [Developed a cloud-native platform to enable bioacoustics researchers to quickly train a custom classifier using transfer learning],
  [Utilized SQLite and approximate nearest neighbor algorithms to efficiently search audio feature embeddings]
)
#project_item(
  name: "eBird Christmas Bird Count Compiler",
  skills: "React, Electron",
  date: "December 2022 - Present",
  [Developed a full-stack electron application to help Christmas bird count organizers compile the data collected from eBird],
  [Utilized puppeteer and leaflet maps to get and display the eBird data],
)
#project_item(
  name: "Winner of the Master Category at Hack WashU 2024",
  skills: [NextJS, Supabase, DeckGL],
  date: "Oct 2024",
  [Developed a website to provide a visual representation of WashU buildings, courses, and their relevant information (#link("https://washucampusview.com", [washucampusview.com]))],
  [Utilized DeckGL to create a 3D map of the buildings and integrated Supabase to store the building data],
)
#project_item(
  name: "Winner of the Emerging Category at Hack WashU 2023",
  skills: "React, Node, Firebase, Cloud Run",
  date: "Oct 2023",
  [Developed a website to alert WashU students when courses without waitlists have open seats],
  [Responsible for the backend (Firebase and Cloud Run) and part of the frontend (integrating APIs)],
)
#project_item(
  name: "Winner of Hack Case Western Reserve University 2024",
  skills: "NextJS, MongoDB",
  date: "Feb 2024",
  [Developed a website to aggregate all of the events at Case Western that serve free food],
  [Fine-tuned a GPT model to correctly identify and rate events that serve food],
)
#project_item(
  name: "Google Student Developer Club at Washington University",
  skills: "NextJS, MongoDB",
  date: "Jan 2024 - Present",
  [Developed a scheduling website for the Down Syndrome Association of Greater St. Louis],
  [Currently Project Management Lead overseeing 5 projects designed to help the St. Louis community],
)
// #project_item(
//   name: "Physical Desmos Calculator",
//   skills: "Onshape, Raspberry Pi, Linux, PCB Design",
//   date: "Jan 2024",
//   [Created a calculator in the form factor of a TI-84 that runs Desmos (a web-based graphing calculator)],
//   [Used Onshape to model the design, 3D printed the calculator, programmed a Raspberry Pi, and designed a PCB for the buttons],
// )


#resume_heading("Technical Skills")
#skill_item(
  category: "Languages",
  skills: "Java, Go, Python, Javascript/Typescript, HTML/CSS, R",
)
#skill_item(
  category: "Other Software/Tools",
  skills: "Git, Docker, Google Firebase, MongoDB, Supabase, Linux, MacOS, Windows",
)
#skill_item(
  category: "Data Analysis",
  skills: "Bayesian hierarchical modeling, Markov Chain Monte Carlo, Linear models, Geospatial Analyses",
)