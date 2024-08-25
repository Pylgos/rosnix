{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  substituteSource,
}:
let
  sources = rec {
    gmock_vendor = substituteSource {
      src = fetchgit {
        name = "gmock_vendor-source";
        url = "https://github.com/ros2-gbp/googletest-release.git";
        rev = "969537cdd819e38a3448dedc902a148616965a9f";
        hash = "sha256-oqAqYShfUP95H55v5CayrGi0vMXgdbUdwKWq7xnKEjI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gmock_vendor";
  version = "1.14.9000-2";
  src = sources.gmock_vendor;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ gtest_vendor ];
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The package provides GoogleMock.";
  };
}
