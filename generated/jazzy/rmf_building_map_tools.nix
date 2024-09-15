{
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_fuel_tools_vendor,
  rclpy,
  rmf_building_map_msgs,
  rmf_site_map_msgs,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_building_map_tools = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "a6b0c09699bf074088d044d3d12641925b532289";
        hash = "sha256-4cUoJgBGbyqyS7tb68emxaWNBl+LdMnihmzy7xwvW90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_map_tools";
  version = "1.9.1-1";
  src = sources.rmf_building_map_tools;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python gz_fuel_tools_vendor rclpy rmf_building_map_msgs rmf_site_map_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "sqlite3" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "RMF Building map tools";
  };
}
