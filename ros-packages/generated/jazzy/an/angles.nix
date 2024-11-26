{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "angles";
  version = "1.16.0-5";
  src = finalAttrs.passthru.sources."angles";
  nativeBuildInputs = [ ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "angles" = substituteSource {
        src = fetchgit {
          name = "angles-source";
          url = "https://github.com/ros2-gbp/angles-release.git";
          rev = "9192c8b6ce21463dcfb1afdb7312257603f34d11";
          hash = "sha256-l4xIXnIMoWmTEkIubTtt1g/NZdI+H9zvYXd0izyPAKw=";
        };
      };
    });
  };
  meta = {
    description = "This package provides a set of simple math utilities to work with angles. The utilities cover simple things like normalizing an angle and conversion between degrees and radians. But even if you're trying to calculate things like the shortest angular distance between two joint space positions of your robot, but the joint motion is constrained by joint limits, this package is what you need. The code in this package is stable and well tested. There are no plans for major changes in the near future.";
  };
})
