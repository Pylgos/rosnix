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
        rev = "949478db25504854988f1510571c5b93a67f9c4b";
        hash = "sha256-hfNPBuRwt4tacGQDjHj0OfgABSsSMXo2L8rlGApqxBc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtest_vendor";
  version = "1.14.9000-2";
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
