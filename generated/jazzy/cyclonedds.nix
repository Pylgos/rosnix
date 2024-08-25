{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_binding_c,
  iceoryx_hoofs,
  iceoryx_posh,
  openssl,
  substituteSource,
}:
let
  sources = rec {
    cyclonedds = substituteSource {
      src = fetchgit {
        name = "cyclonedds-source";
        url = "https://github.com/ros2-gbp/cyclonedds-release.git";
        rev = "73713526652778f6d7b1cea5a4aa9e27c52f8fb3";
        hash = "sha256-JFn8HlIahFX99o5SBpVkhfap+EIKfLy3mZICNlZNh0o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cyclonedds";
  version = "0.10.5-1";
  src = sources.cyclonedds;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_binding_c iceoryx_hoofs iceoryx_posh openssl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Eclipse Cyclone DDS is a very performant and robust open-source DDS implementation. Cyclone DDS is developed completely in the open as an Eclipse IoT project.";
  };
}
