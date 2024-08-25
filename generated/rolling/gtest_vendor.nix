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
    gtest_vendor = substituteSource {
      src = fetchgit {
        name = "gtest_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "76baff7823620c1c36ed5464b28bfd8c9b52d081";
        hash = "sha256-Zg30M2S4KqWNrzQZyuVcTjvY7oCPPsWbnfMQ+fvV768=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtest_vendor";
  version = "1.15.0-1";
  src = sources.gtest_vendor;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The package provides GoogleTest.";
  };
}
