{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    shared_queues_vendor = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "b6134b7292a65ce2151f04b7b7faa20cbb4f1df1";
        hash = "sha256-BrWsI3yFX/Qg+13ZAMwMXRBH47qhG+nVbHpuNHNjM0k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0}";
        }
      ];
    };
    shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0 = substituteSource {
      src = fetchzip {
        name = "shared_queues_vendor-vendor_source-ef7dfbf553288064347d51b8ac335f1ca489032a-0-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shared_queues_vendor";
  version = "0.26.4-1";
  src = sources.shared_queues_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Vendor package for concurrent queues from moodycamel";
  };
}
