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
        rev = "4b7d15946d7e8093ad678c95a57397b94e663031";
        hash = "sha256-8IA8dKcL9AG0xtXDPn5m0P13buJaZryijdm8U9hjXWc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_ik";
  version = "2.3.3-1";
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
