import { StyleSheet, Text, View } from "react-native";


export default function Index() {
	return (
		<View style={styles.container}>
			<Text>Edit app/index.tsx to edit this screen.</Text>
		</View>
	);
}


const styles = StyleSheet.create({
	container: {
		backgroundColor: '#FF0000',
		padding: 24,
	}
})