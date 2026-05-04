{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qpoases_vendor";
  version = "3.2.3-5";
  src = finalAttrs.passthru.sources."qpoases_vendor";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "subversion" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "subversion" ]; };
  passthru.sources = mkSourceSet (sources: {
    "qpoases_vendor" = substituteSource {
      src = fetchgit {
        name = "qpoases_vendor-source";
        url = "https://github.com/ros2-gbp/qpoases_vendor-release.git";
        rev = "2e7c81946337e2fe3bb137c784bfdbdee3408258";
        hash = "sha256-jUSNiB8b0P8JHYXdXeKMs5Ucxjk+fhbPqxcJnD2GIQ4=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around qpOASES to make it available to the ROS ecosystem.\n  ";
  };
})
