{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    tlsf = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "e5404343cc186e3237c2bae081bcc270af9eab45";
        hash = "sha256-y3cjlV+RU4Go9bap7m+OMAdNUie5Z4IAVrrp7tyyBpw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf";
  version = "0.9.0-3";
  src = sources.tlsf;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "TLSF allocator version 2.4.6";
  };
}
