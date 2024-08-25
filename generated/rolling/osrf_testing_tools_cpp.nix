{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    osrf_testing_tools_cpp = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "72929ad603027203d6da59ab07cec0187c54beaa";
        hash = "sha256-Bi9mcQEbfiJ7oOCciXJR8uWeIrVxnqF81Ke202qC4do=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_testing_tools_cpp";
  version = "2.2.0-1";
  src = sources.osrf_testing_tools_cpp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Testing tools for C++, and is used in various OSRF projects.";
  };
}
