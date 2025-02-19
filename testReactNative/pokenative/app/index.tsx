import { ThemedText } from "@/components/ThemedText";
import { Link } from "expo-router";
import { StyleSheet, Text, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function Index() {
	return (
		<SafeAreaView style={styles.container}>
			<ThemedText variant="headline">Pokédex</ThemedText>
		</SafeAreaView>
	);
}


const styles = StyleSheet.create({
	container: {
		backgroundColor: '#FF0000',
	}
})