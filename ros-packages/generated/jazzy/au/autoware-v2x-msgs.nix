{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_v2x_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_v2x_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_v2x_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_v2x_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "f2ba8c9d81e598f4a6e7ec62113c8da192fe5872";
        hash = "sha256-V4eDaBuu/F9YjlUWw8kaA+l8EjGf0R0Pb+jO3OO/AM4=";
      };
    };
  });
  meta = {
    description = "Autoware v2x messages package.";
  };
})
