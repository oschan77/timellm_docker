## Steps to run the Docker container
1. Install Docker
2. INstall NVIDIA Container Toolkit
3. git clone https://github.com/oschan77/timellm_docker.git
4. cd timellm_docker/
5. sudo chmod +x run_container.sh
6. ./run_container.sh
7. docker exec -it timellm /bin/bash
8. conda env list
9. conda deactivate
10. conda activate timellm
11. cd /home/Time-LLM
12. bash scripts/TimeLLM_Weather_eval.sh
