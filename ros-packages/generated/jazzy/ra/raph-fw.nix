{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_fw";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."raph_fw";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-rich" "python3-zeroconf" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-rich" "python3-zeroconf" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_fw" = substituteSource {
      src = fetchgit {
        name = "raph_fw-source";
        url = "https://github.com/ros2-gbp/raph_robot-release.git";
        rev = "eb37397ecf4cdc7de9c57ae15235327ed109ee85";
        hash = "sha256-r5e5ZgOeuOljtI+n0cJ0lS9Mfmvp++0F725bvApk9aQ=";
      };
    };
  });
  meta = {
    description = "Binary releases of the RaphCore firmware and related utilities";
  };
})
