{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "controller_interface" = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "3a0388e8e62e26c5033051f9b25a331c6290af4f";
        hash = "sha256-qu4nDCcQ6e51qGXNns0io2ODEzPuH/EABT5JGxfPPcI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "controller_interface";
  version = "4.17.0-1";
  src = sources."controller_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ hardware-interface rclcpp-lifecycle sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Description of controller_interface";
  };
}
