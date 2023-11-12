import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import styles from './App.module.css'
import './index.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div className={styles.outer}>
        <div className={styles.inner}>
          <a href="https://vitejs.dev" target="_blank">
            <img src={viteLogo} className={styles.logo} alt="Vite logo" />
          </a>
          <a href="https://react.dev" target="_blank">
            <img src={reactLogo} className={`${styles.logo} ${styles.react}`} alt="React logo" />
          </a>
          <h1 className={styles.text}>Vite + React</h1>
          <div className={styles.card}>
            <button onClick={() => setCount((count) => count + 1)}>
              count is {count}
            </button>
            <p>
              Edit <code>src/App.tsx</code> and save to test HMR
            </p>
          </div>
          <p className={styles.read}>
            Click on the Vite and React logos to learn more
          </p>
        </div>
      </div>

    </>
  )
}

export default App
