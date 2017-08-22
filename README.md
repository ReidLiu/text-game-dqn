# text-game-dqn
DQN for textual game control policy learning

Deep Reinforcement Learning with Textual Representations
===================================================

Prerequisites
-------------

- [Torch](http://torch.ch/docs/getting-started.html)  
- Game environment setting: [HomeM World](https://github.com/ReidLiu/text-world.git) and [Fantasy World](https://github.com/ReidLiu/text-world-fantasy.git)
- Lua Package: [luasocket](http://w3.impa.br/~diego/software/luasocket/) , [rnn](https://github.com/Element-Research/rnn) and  underscore. Those packages can be installed using `luarocks install <pkg>`


Running
----------

In the script 'run_cpu', you can find all the parameters that used by the program and it can be defined by user. 
The running command is './run_cpu <game_num>' and the \<game_num\> can allow user to choose the game server when multiple games are running at the same time. It could be 1, 2, 3, etc.

In the 'run_cpu' file, there are some parameters need to be set.
1. text_world_location: It is the location of the game world directory on your machine. In our case, you should have cloned the directory for [HomeM World](https://github.com/ReidLiu/text-world.git) and [Fantasy World](https://github.com/ReidLiu/text-world-fantasy.git)
2. STEP_Size: It is the number of steps taken by the agent in the game in an epoch.
3. max_steps: Maximum number of steps per episode. 
4. recurrent: If you use the LSTM for the Representation Generator, it need to be set as 1.
5. bigram: If you use a bag-of-bigrams as the Representation Generator, it need to be set as 1.
6. netfile: It is used to choose the Representation Generator model. Before it, the `recurrent` option need to be set appropriately.


Author
------

Xinyu Liu
