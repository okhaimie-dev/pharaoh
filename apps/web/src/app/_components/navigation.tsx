import { getDashboardPath } from "../_helpers/routes";
import NavigationItem from "./navigation-item";

export default function Navigation() {
  return (
		<nav className="hidden lg:block">
			<ul className="flex gap-2">
				<NavigationItem
					label="Dashboard"
					pathname={getDashboardPath()}
				/>
			</ul>
		</nav>
	);
}
