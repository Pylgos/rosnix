{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_std_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_std_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_std_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_std_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "368345fd8e93cc486f7598efb87b2add63b9135f";
        hash = "sha256-GFuWPljwfE/jEfBaFCmvOhZ9J4RtJas+R0QBEtFDFPs=";
      };
    };
  });
  meta = {
    description = "The tuw_std_msgs package";
  };
})
