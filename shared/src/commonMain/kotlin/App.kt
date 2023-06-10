import androidx.compose.foundation.background
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.material.darkColors
import androidx.compose.material.lightColors
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier

@Composable
fun App() {
    MaterialTheme(
        colors = if (isSystemInDarkTheme()) darkColors() else lightColors()
    ) {
        val data: List<String> = remember { List(100) { "hello $it" } }

        LazyColumn(
            modifier = Modifier
                .background(MaterialTheme.colors.background)
                .fillMaxSize(),
        ) {
            items(data) { item ->
                Text(item, color = MaterialTheme.colors.onBackground)
            }
        }
    }
}

expect fun getPlatformName(): String