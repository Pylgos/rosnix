{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-planning-msgs,
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
  pname = "autoware_vehicle_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_vehicle_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ autoware-planning-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-planning-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_vehicle_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "cc60d3733ab854dfdbc57a1dde7fa9a304cf0be7";
        hash = "sha256-ElYpDeK+RFf0aADzbP1amdYDqlgDeMMxzIREq/gfX9Y=";
      };
    };
  });
  meta = {
    description = "Interfaces between core Autoware vehicle components";
  };
})
