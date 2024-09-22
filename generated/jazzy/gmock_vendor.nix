{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gmock_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gmock_vendor-source";
        owner = "ros2-gbp";
        repo = "googletest-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gtest_vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gtest_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The package provides GoogleMock.";
  };
}
