{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zenoh_bridge_dds-9bfadd4d1132571b6ac912a2f1746d1113cf5258 = substituteSource {
      src = fetchgit {
        name = "zenoh_bridge_dds-9bfadd4d1132571b6ac912a2f1746d1113cf5258-source";
        url = "https://github.com/ros2-gbp/zenoh_bridge_dds-release.git";
        rev = "9bfadd4d1132571b6ac912a2f1746d1113cf5258";
        hash = "sha256-f7l+qyV5vSYtTVBV57bVQUV49odL51NPVkvmo00gimY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zenoh_bridge_dds";
  version = "0.5.0-5";
  src = sources.zenoh_bridge_dds-9bfadd4d1132571b6ac912a2f1746d1113cf5258;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cargo" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Bridge between ROS2/DDS and Eclipse zenoh (https://zenoh.io). It allows the integration of zenoh applications with ROS2, or the tunneling of ROS2 communications between nodes via the zenoh protocol at Internet scale.";
  };
}
