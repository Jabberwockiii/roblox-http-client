from stable_baselines3 import A2C

model = A2C('MlpPolicy', 'CartPole-v1').learn(10000)

obs = env.reset()
for i in range(1000):
    action, _state = model.predict(obs, deterministic=True)
    obs, reward, done, info = env.step(action)
    env.render()
    if done:
      obs = env.reset()