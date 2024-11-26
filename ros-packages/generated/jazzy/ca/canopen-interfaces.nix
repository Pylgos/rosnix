{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_interfaces";
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_interfaces" = substituteSource {
      src = fetchgit {
        name = "canopen_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "45c79d4c66a246d9b5b6f71e9c79865e1be15b27";
        hash = "sha256-b4Art6VZ5FZEibqz5dLOW4lYb2loGS/4m9HV9+jWrS4=";
      };
    };
  });
  meta = {
    description = "Services and Messages for ros2_canopen stack";
  };
})
