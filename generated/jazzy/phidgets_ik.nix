{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_analog_inputs,
  phidgets_digital_inputs,
  phidgets_digital_outputs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_ik = substituteSource {
      src = fetchgit {
        name = "phidgets_ik-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "1494b1d4035ef6de251e503e91dd1b7b9b0907c7";
        hash = "sha256-8IA8dKcL9AG0xtXDPn5m0P13buJaZryijdm8U9hjXWc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_ik";
  version = "2.3.3-2";
  src = sources.phidgets_ik;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_analog_inputs phidgets_digital_inputs phidgets_digital_outputs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets InterfaceKit devices";
  };
}
