# ruby-sample-app

TBD
Short project description goes here.

## Table of Contents

- [About](#about)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Things to imporve](#things-to-improve)

## About

TBD
Provide a brief overview of your Sinatra project. What does it do? Why did you create it?

## Getting Started

### Prerequisites

List any prerequisites or dependencies required to run your project. For example:

- Ruby [3.2+]
- Sinatra [2.2+]
- Docker [20.10+]

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/ruby-sample-app.git

# Change directory to your project
cd ruby-sample-app

# Build docker image
docker build -t ruby-sample-app:0.0.1 .
```

## Usage

```bash
# Run docker container
docker build -t ruby-sample-app:0.0.1 .
```

### Possible improvements
In ideal world this should go to issues tracker: 
- is `pg` really needed?
- environment specific configuration should be moved to corresponding files/env variables
- consider using different base image for smaller image size/security reasons
- docker image should be built on CI
