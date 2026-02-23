{
  ament-cmake,
  ament-cmake-python,
  automatika-ros-sugar,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "automatika_embodied_agents";
  version = "0.5.1-1";
  src = finalAttrs.passthru.sources."automatika_embodied_agents";
  nativeBuildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedNativeBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" "python3-websockets" ]; };
  buildInputs = [ ament-cmake ament-cmake-python rosidl-default-generators ];
  propagatedBuildInputs = [ automatika-ros-sugar builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-httpx" "python3-platformdirs" "python3-tqdm" "python3-websockets" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "automatika_embodied_agents" = substituteSource {
      src = fetchgit {
        name = "automatika_embodied_agents-source";
        url = "https://github.com/ros2-gbp/automatika_embodied_agents-release.git";
        rev = "f137935efcf44a6022d6343530cc5ef11c01ac47";
        hash = "sha256-2tl4mxxAQS8yO3+L6orFcYwTVF/IXKc3gXzZQSE0heM=";
      };
    };
  });
  meta = {
    description = "agents";
  };
})
